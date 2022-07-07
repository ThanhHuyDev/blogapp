import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/utils/config/app_router.dart';
import 'package:blogapp/utils/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'features/screens/onboarding/presentasions/bloc/image_album/image_album_bloc.dart';
import 'features/screens/onboarding/presentasions/bloc/image_avatar/image_avatar_bloc.dart';
import 'features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'services/firebase/firebase_reponsitory/user/user_reponsitory.dart';

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SwitchBloc()),
          BlocProvider(
              create: (context) => AuthBloc(
                    authReponsitory: context.read<AuthReponsitory>(),
                    userReponsitory: context.read<UserReponsitory>(),
                  )),
          BlocProvider(
              create: (context) => ImageAlbumBloc(
                  userReponsitory: context.read<UserReponsitory>())
                ..add(LoadImages())),
          BlocProvider(
              create: (context) => ImageAvatarBloc(
                  userReponsitory: context.read<UserReponsitory>())
                ..add(LoadImage())),
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
              initialRoute: OnboardingScreens.routeName,
            );
          },
        ),
      ),
    );
  }
}
