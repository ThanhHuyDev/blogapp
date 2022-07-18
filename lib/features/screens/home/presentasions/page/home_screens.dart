import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/home/presentasions/bloc/profile_home/profile_home_bloc.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/list_post_user.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/post_moment.dart';
import 'package:blogapp/features/screens/profile/presentasions/page/user_screen.dart';
import 'package:blogapp/features/screens/upload_post/presentasions/page/upload_post_screen.dart';
import 'package:blogapp/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../settings/presentasions/bloc/export_bloc.dart';
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
          backgroundColor: Theme.of(context).bottomAppBarColor,
          leading: Icon(
            Icons.abc,
            color: Theme.of(context).bottomAppBarColor,
          ),
          centerTitle: true,
          title: const Text('BLOGGER',
              style: TextStyle(fontSize: 24, color: Colors.red)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, UserScreens.routeName);
                },
                icon: SvgPicture.asset(
                  'assets/icons/ic_user.svg',
                  height: 25,
                )),
          ],
        ),
        body: BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
            builder: (context, state) {
          if (state is ProfileLoadingg) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoadedd) {
            UserApp user = state.user;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  PostCard(
                    user: user,
                    press: () {
                      Navigator.pushNamed(context, UploadPost.routeName);
                    },
                  ),
                  const Line(
                    height: 4,
                  ),
                  PostMoment(
                    user: user,
                  ),
                  const Line(
                    height: 4,
                  ),
                  const ListPost(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('something went wrong !'),
            );
          }
        }));
  }
}
