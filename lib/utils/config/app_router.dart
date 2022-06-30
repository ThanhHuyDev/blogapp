import 'package:flutter/material.dart';
import '../../features/screens/home/home.dart';

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
