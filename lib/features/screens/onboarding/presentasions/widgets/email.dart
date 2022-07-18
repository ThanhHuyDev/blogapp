import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';
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
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(children: [
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
                          // ignore: avoid_print
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
                          // ignore: avoid_print
                          print(state.password);
                        },
                        text: 'Password'),
                  ],
                ),
              ),
              const SizedBox(
                height: 240,
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
                      press: () async {
                        await context
                            .read<SignupCubit>()
                            .signupWithCredentials();
                        UserApp user = UserApp(
                          // ignore: use_build_context_synchronously
                          id: context.read<SignupCubit>().state.userAuth!.uid,
                          fullName: '',
                          age: '',
                          gender: '',
                          status: '',
                          phoneNumber: '',
                          imageAvatar: '',
                          imageUrl: const [],
                        );
                        // ignore: use_build_context_synchronously
                        context
                            .read<OnloadingBloc>()
                            .add(StartOnloading(user: user));
                        tabController.animateTo(tabController.index + 1);
                      })
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
