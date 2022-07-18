import 'dart:async';
import 'package:blogapp/features/screens/login/presentasions/page/login_screen.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import '../home/presentasions/page/home_screens.dart';
import '../onboarding/presentasions/page/onboarding_screen.dart';
import '../settings/presentasions/bloc/export_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => false),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Timer(const Duration(seconds: 3),
                () => Navigator.of(context).pushNamed(LoginScreen.routeName));
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
                const Duration(seconds: 3),
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreens.routeName, ModalRoute.withName('/')));
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/img_onboarding.png',
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
