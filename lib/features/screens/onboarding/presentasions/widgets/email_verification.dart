import 'package:blogapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../widgets/button_default.dart';
import '../../../../../widgets/text_header.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification(
      {Key? key, required this.tabController, this.controller})
      : super(key: key);
  final TabController tabController;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              CustomTextHeader(
                tabController: tabController,
                text: 'Enter your Code?',
              ),
              const CustomTextField(text: 'Code'),
            ],
          ),
        ),
        Column(
          children: [
            const StepProgressIndicator(
              totalSteps: 4,
              currentStep: 2,
              selectedColor: Colors.deepOrange,
              unselectedColor: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonDefault(
              title: 'Continute',
              press: () {
                tabController.animateTo(tabController.index + 1);
              },
            )
          ],
        ),
      ]),
    );
  }
}
