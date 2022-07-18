import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'package:blogapp/features/screens/profile/presentasions/bloc/profile/profile_bloc.dart';
import 'package:blogapp/features/screens/profile/presentasions/widgets/edit_topic_infomation.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/widgets/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserScreens extends StatelessWidget {
  static const String routeName = '/editusers';

  const EditUserScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const EditUserScreens());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _buildUserAvatar(context, state.user),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      EditTopicInfomation(
                        title: state.user.fullName,
                        press: () {},
                      ),
                      EditTopicInfomation(
                        title: state.user.age.toString(),
                        press: () {},
                      ),
                      EditTopicInfomation(
                        title: state.user.phoneNumber,
                        press: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonDefault(
                        title: 'Save',
                        press: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonDefault(
                        title: 'Outlog',
                        press: () {
                          RepositoryProvider.of<AuthReponsitory>(context)
                              .signOut();
                          Navigator.pushNamed(
                              context, OnboardingScreens.routeName);
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('somthing went wrong'),
            );
          }
        },
      ),
    );
  }

  Row _buildUserAvatar(BuildContext context, UserApp user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.imageAvatar),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurple,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
  // Stack(
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height / 4,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           boxShadow: const [
          //             BoxShadow(
          //                 color: Colors.grey,
          //                 offset: Offset(3, 3),
          //                 blurRadius: 3,
          //                 spreadRadius: 3)
          //           ],
          //           image: DecorationImage(
          //               fit: BoxFit.cover,
          //               image: NetworkImage(user.imageUrl[0]))),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height / 4,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           gradient: LinearGradient(
          //               colors: [
          //                 Colors.black12.withOpacity(0.1),
          //                 Colors.black12.withOpacity(0.9),
          //               ],
          //               begin: Alignment.topCenter,
          //               end: Alignment.bottomCenter)),
          //       child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text(
          //             user.name,
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .headline4!
          //                 .copyWith(color: Colors.white),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
