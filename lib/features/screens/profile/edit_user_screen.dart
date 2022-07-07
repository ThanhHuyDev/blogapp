import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/profile/edit_topic_infomation.dart';
import 'package:blogapp/widgets/button_default.dart';
import 'package:flutter/material.dart';

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
    final UserApp user = UserApp.users[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
          const SizedBox(
            height: 20,
          ),
          _buildUserAvatar(context),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                EditTopicInfomation(
                  title: user.fullName,
                  press: () {},
                ),
                EditTopicInfomation(
                  title: user.age.toString(),
                  press: () {},
                ),
                EditTopicInfomation(
                  title: user.phoneNumber,
                  press: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonDefault(
                  title: 'Save',
                  press: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildUserAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://scontent.fdad3-4.fna.fbcdn.net/v/t39.30808-6/272661431_1107969983372040_196971888314167653_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=0DpHYfySoxwAX9x7Lbs&_nc_oc=AQmToV6EhREQx3Cx6moZPRozxBPFn7VcNlC3-M4UKjuHxhtay8tYRAvOcAoHEEHtN3soE_Ks9ARAQ5yvyCOFMKBN&_nc_ht=scontent.fdad3-4.fna&oh=00_AT9aZRj_XmRtj_MGAv80sbivNrJ7Xc-GHLu1BmxBZRyMlw&oe=62CAFCAD'),
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
