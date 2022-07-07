import 'package:flutter/material.dart';

import '../../../../../widgets/button_default.dart';

class Start extends StatelessWidget {
  const Start({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/img_onboarding.png',
            ),
            const SelectableText.rich(TextSpan(children: [
              TextSpan(
                  text: 'Wellcome to Blog',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              TextSpan(
                  text: '\n\nChuc ban co mot trai nghiem tot ve blog...\n',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ])),
            const SizedBox(
              height: 50,
            ),
            ButtonDefault(
              title: 'Continute',
              press: () {
                tabController.animateTo(tabController.index + 1);
              },
            )
          ]),
    );
  }
}
