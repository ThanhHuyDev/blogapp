import 'package:blogapp/features/screens/onboarding/presentasions/widgets/infomation.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/widgets/pictures.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/widgets/start.dart';
import 'package:flutter/material.dart';

import '../widgets/email.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = '/onbroading';

  const OnboardingScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OnboardingScreens(),
    );
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
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
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
