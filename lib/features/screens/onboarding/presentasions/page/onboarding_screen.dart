import 'package:blogapp/features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/cubits/signup/signup_cubit.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/widgets/infomation.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/widgets/pictures.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/widgets/start.dart';
import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:flutter/material.dart';

import '../widgets/email.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = '/onbroading';

  const OnboardingScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => SignupCubit(
                      authReponsitory: context.read<AuthReponsitory>()),
                ),
                BlocProvider(
                  create: (_) => OnloadingBloc(
                      userReponsitory: UserReponsitory(),
                      storageRepository: StorageRepository())
                    ..add(StartOnloading()),
                ),
              ],
              child: const OnboardingScreens(),
            ));
  }

  static const List<Tab> tabs = <Tab>[
    Tab(
      text: 'Start',
    ),
    Tab(
      text: 'Email',
    ),
    Tab(
      text: 'Infomation',
    ),
    Tab(
      text: 'Pictures',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(children: [
            Start(tabController: tabController),
            Email(tabController: tabController),
            Infomation(tabController: tabController),
            Pictures(tabController: tabController),
          ]),
        );
      }),
    );
  }
}
