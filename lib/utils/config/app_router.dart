import 'package:blogapp/features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'package:blogapp/features/screens/profile/edit_user_screen.dart';
import 'package:flutter/material.dart';
import '../../features/screens/home/home.dart';
import '../../features/screens/settings/presentasions/settings.dart';
import '../../features/screens/profile/user_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print("The route is: ${settings.name}");

    switch (settings.name) {
      case '/':
        return HomeScreens.route();
      // ignore: no_duplicate_case_values
      case HomeScreens.routeName:
        return HomeScreens.route();
      case UserScreens.routeName:
        return UserScreens.route();
      case SettingScreen.routeName:
        return SettingScreen.route();
      case OnboardingScreens.routeName:
        return OnboardingScreens.route();
      case EditUserScreens.routeName:
        return EditUserScreens.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("error"),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
