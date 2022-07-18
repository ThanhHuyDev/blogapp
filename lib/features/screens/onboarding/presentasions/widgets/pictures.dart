import 'package:blogapp/features/screens/home/home.dart';
import 'package:blogapp/features/screens/login/presentasions/page/login_screen.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';
import 'package:blogapp/widgets/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../widgets/button_default.dart';
import '../../../../../widgets/text_header.dart';
import '../../../settings/presentasions/bloc/export_bloc.dart';

class Pictures extends StatelessWidget {
  const Pictures({Key? key, this.tabController}) : super(key: key);
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnloadingBloc, OnloadingState>(
        builder: (context, state) {
      if (state is Onloading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is Onloaded) {
        var images = state.user.imageUrl;
        var imageCount = images!.length;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextHeader(
                        tabController: tabController!,
                        text: 'Add picture album',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 410,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 0.66),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return (imageCount > index)
                                  ? CustomImageContainer(
                                      imageUrl: images[index],
                                      height: 150,
                                      width: 103,
                                    )
                                  : const CustomImageContainer(
                                      height: 150,
                                      width: 103,
                                    );
                            }),
                      )
                      // return Column(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         (imageCount > 1)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[1])
                      //             : const CustomImageContainer(),
                      //         (imageCount > 2)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[2])
                      //             : const CustomImageContainer(),
                      //         (imageCount > 3)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[3])
                      //             : const CustomImageContainer(),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         (imageCount > 4)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[4])
                      //             : const CustomImageContainer(),
                      //         (imageCount > 5)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[5])
                      //             : const CustomImageContainer(),
                      //         (imageCount > 6)
                      //             ? CustomImageContainer(
                      //                 imageUrl: state.imageUrls[6])
                      //             : const CustomImageContainer(),
                      //       ],
                      //     )
                      //   ],
                      // );
                    ],
                  ),
                ),
                Column(
                  children: [
                    const StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: 3,
                      selectedColor: Colors.deepOrange,
                      unselectedColor: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonDefault(
                      title: 'Continute',
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, HomeScreens.routeName);
                      },
                    )
                  ],
                ),
              ]),
        );
      } else {
        return const Text('some thing swrong!');
      }
    });
  }
}
