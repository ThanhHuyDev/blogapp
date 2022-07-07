import 'package:blogapp/features/screens/home/home.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/image_album/image_album_bloc.dart';
import 'package:blogapp/widgets/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../widgets/button_default.dart';
import '../../../../../widgets/text_header.dart';
import '../../../settings/presentasions/bloc/export_bloc.dart';

class Pictures extends StatelessWidget {
  const Pictures({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                tabController: tabController,
                text: 'Add picture album',
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<ImageAlbumBloc, ImageAlbumState>(
                builder: (context, state) {
                  if (state is ImageAlbumLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ImageAlbumLoaded) {
                    var imageCount = state.imageUrls.length;
                    return SizedBox(
                      height: 410,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 0.66),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return (imageCount > index + 1)
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[index + 1],
                                  )
                                : const CustomImageContainer();
                          }),
                    );
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
                  } else {
                    return const Text('some thing swrong!');
                  }
                },
              ),
            ],
          ),
        ),
        Column(
          children: [
            const StepProgressIndicator(
              totalSteps: 4,
              currentStep: 4,
              selectedColor: Colors.deepOrange,
              unselectedColor: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonDefault(
              title: 'Continute',
              press: () {
                Navigator.pushReplacementNamed(context, HomeScreens.routeName);
              },
            )
          ],
        ),
      ]),
    );
  }
}
