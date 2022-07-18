import 'package:blogapp/features/screens/profile/presentasions/bloc/profile/profile_bloc.dart';
import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
import 'package:blogapp/features/screens/splash/splash_screen.dart';
import 'package:blogapp/features/screens/upload_post/presentasions/bloc/post/post_bloc.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/post_status/post_status_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:blogapp/utils/config/app_router.dart';
import 'package:blogapp/utils/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'features/screens/home/presentasions/bloc/profile_home/profile_home_bloc.dart';
import 'features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';
import 'features/screens/onboarding/presentasions/cubits/signup/signup_cubit.dart';
import 'features/screens/upload_post/presentasions/bloc/bloc/user_post_bloc.dart';
import 'services/firebase/firestore_reponsitory/user/user_reponsitory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthReponsitory()),
        RepositoryProvider(create: (context) => UserReponsitory()),
        RepositoryProvider(create: (context) => PostStatusReponsitory()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SwitchBloc()),
          BlocProvider(
              create: (context) => AuthBloc(
                  authReponsitory: context.read<AuthReponsitory>(),
                  userReponsitory: context.read<UserReponsitory>())),
          BlocProvider(
              create: (context) => ProfileBloc(
                  authBloc: context.read<AuthBloc>(),
                  userReponsitory: context.read<UserReponsitory>())
                ..add(LoadProfile(
                    userId: context.read<AuthBloc>().state.userAuth!.uid))),
          BlocProvider(
              create: (context) => ProfileHomeBloc(
                  authBloc: context.read<AuthBloc>(),
                  userReponsitory: context.read<UserReponsitory>())
                ..add(const LoadProfilee())),
          BlocProvider(
            create: (context) =>
                SignupCubit(authReponsitory: context.read<AuthReponsitory>()),
          ),
          BlocProvider(
              create: (context) => OnloadingBloc(
                  userReponsitory: UserReponsitory(),
                  storageRepository: StorageRepository())),
          BlocProvider(
              create: (context) => PostBloc(
                  postStatusReponsitory: context.read<PostStatusReponsitory>())
                ..add(LoadPosts(
                    postId: context.read<AuthBloc>().state.userAuth!.uid))),
          BlocProvider(
              create: (context) => UserPostBloc(
                  postStatusReponsitory:
                      context.read<PostStatusReponsitory>())),
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Blog app',
              debugShowCheckedModeBanner: false,
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: SplashScreen.routeName,
            );
          },
        ),
      ),
    );
  }
}
