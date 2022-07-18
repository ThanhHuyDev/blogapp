import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/profile/presentasions/widgets/image_container.dart';
import 'package:flutter/material.dart';

class UserPictures extends StatelessWidget {
  static const String routeName = '/userpicture';
  const UserPictures({Key? key, required this.user}) : super(key: key);

  static Route route({required UserApp user}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => UserPictures(user: user));
  }

  final UserApp user;
  @override
  Widget build(BuildContext context) {
    var imageCount = user.imageUrl!.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: const Text('Album ảnh'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SizedBox(
          height: 410,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 1,
                  crossAxisCount: 3,
                  childAspectRatio: 0.66),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return (imageCount > index)
                    ? ImageContainer(
                        imageUrl: user.imageUrl![index],
                        height: 80,
                        width: 60,
                      )
                    : const ImageContainer(
                        height: 80,
                        width: 60,
                      );
              }),
        ),
      ),
    );
  }
}
