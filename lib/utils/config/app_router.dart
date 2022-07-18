import 'package:blogapp/features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'package:blogapp/features/screens/profile/presentasions/page/edit_user_screen.dart';
import 'package:blogapp/features/screens/profile/presentasions/widgets/user_picture.dart';
import 'package:blogapp/features/screens/splash/splash_screen.dart';
import 'package:blogapp/features/screens/upload_post/presentasions/page/upload_post_screen.dart';
import 'package:flutter/material.dart';
import '../../entities/models/user_model.dart';
import '../../features/screens/home/home.dart';
import '../../features/screens/login/presentasions/page/login_screen.dart';
import '../../features/screens/settings/presentasions/settings.dart';
import '../../features/screens/profile/presentasions/page/user_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print("The route is: ${settings.name}");

    switch (settings.name) {
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
      case SplashScreen.routeName:
        return SplashScreen.route();
      case UploadPost.routeName:
        return UploadPost.route();
      case UserPictures.routeName:
        return UserPictures.route(user: settings.arguments as UserApp);
      case LoginScreen.routeName:
        return LoginScreen.route();
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
