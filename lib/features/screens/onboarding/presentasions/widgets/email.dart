import 'package:blogapp/features/screens/onboarding/presentasions/cubits/signup/signup_cubit.dart';
import 'package:blogapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../widgets/button_default.dart';
import '../../../../../widgets/text_header.dart';

class Email extends StatelessWidget {
  const Email({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      CustomTextHeader(
                        tabController: tabController,
                        text: 'Enter your Email Address ?',
                      ),
                      CustomTextField(
                          onchanged: (value) {
                            context.read<SignupCubit>().emailChanged(value);
                            print(state.email);
                          },
                          text: 'Email'),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomTextHeader(
                        tabController: tabController,
                        text: 'Enter your Password ?',
                      ),
                      CustomTextField(
                          onchanged: (value) {
                            context.read<SignupCubit>().passwordChanged(value);
                            print(state.password);
                          },
                          text: 'Password'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: 1,
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
                          context.read<SignupCubit>().signupWithCredentials();
                        })
                  ],
                ),
              ]),
        );
      },
    );
  }
}
