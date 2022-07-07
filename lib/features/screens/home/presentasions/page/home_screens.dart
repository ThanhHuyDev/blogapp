import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/post_moment.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/post_user.dart';
import 'package:blogapp/features/screens/profile/user_screen.dart';
import 'package:blogapp/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../home.dart';

class HomeScreens extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreens());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                )),
            const Expanded(
                flex: 3,
                child: Text('BLOGGER',
                    style: TextStyle(fontSize: 24, color: Colors.red)))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UserScreens.routeName);
              },
              icon: SvgPicture.asset(
                'assets/icons/ic_user.svg',
                height: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            PostCard(
              user: UserApp.users[0],
              press: () {},
            ),
            const Line(),
            PostMoment(
              user: UserApp.users[0],
            ),
            const Line(),
            _listPostUser(UserApp.users[0]),
          ],
        ),
      ),
    );
  }

  _listPostUser(UserApp user) {
    return Column(
      children: List.generate(5, (index) {
        return PostUser(
          user: user,
          radius: 0,
        );
      }),
    );
  }
}
