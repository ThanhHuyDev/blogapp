import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/list_post_user.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'package:blogapp/features/screens/profile/presentasions/bloc/profile/profile_bloc.dart';
import 'package:blogapp/features/screens/profile/presentasions/widgets/user_picture.dart';
import 'package:blogapp/features/screens/settings/presentasions/page/setting_screen.dart';
import 'package:blogapp/features/screens/profile/presentasions/page/edit_user_screen.dart';
import 'package:blogapp/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../settings/presentasions/bloc/export_bloc.dart';

class UserScreens extends StatefulWidget {
  static const String routeName = '/users';

  const UserScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return (BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated)
              ? const OnboardingScreens()
              : const UserScreens();
        });
  }

  @override
  State<UserScreens> createState() => _UserScreensState();
}

class _UserScreensState extends State<UserScreens>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoaded) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).bottomAppBarColor,
                  expandedHeight: 300,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      state.user.imageUrl![0],
                      fit: BoxFit.cover,
                    ),
                    centerTitle: true,
                    titlePadding:
                        const EdgeInsets.only(left: 36, right: 36, bottom: 10),
                    title: Text(
                      '♪${state.user.fullName} ♥',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      'assets/icons/ic_back.svg',
                      color: Colors.white,
                      height: 25,
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, EditUserScreens.routeName);
                        },
                        icon: const Icon(Icons.mode_edit_outlined)),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SettingScreen.routeName);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/ic_setting.svg',
                          color: Colors.white,
                          height: 20,
                        )),
                  ],
                ),
                SliverToBoxAdapter(
                  child: _buildDetailUser(state.user, context),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('something went wrong'),
            );
          }
        },
      ),
    );
  }
}

Widget _buildDetailUser(UserApp user, BuildContext context) {
  var imagesLenght = user.imageUrl!.length;
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 5,
        ),
        Center(
          child: CircleAvatar(
            radius: 41,
            backgroundColor: Colors.deepOrange,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.imageAvatar),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Center(
            child: Text(
              '#${user.status}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UserPictures.routeName,
                    arguments: user);
              },
              child: Container(
                height: 40,
                width: 140,
                padding: const EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 7,
                        spreadRadius: 1,
                        offset: const Offset(2, 2)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.image_outlined, color: Colors.deepOrange[300]),
                    const Text('Album ảnh'),
                    Text(imagesLenght.toString())
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 40,
              width: 150,
              padding: const EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: const Offset(2, 2)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    color: Colors.deepOrange[300],
                  ),
                  const Text('Khoảnh Khắc'),
                  const Text('0')
                ],
              ),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Text('Bài đăng')),
        const Line(
          height: 1,
        ),
        const ListPost()
      ]),
    ),
  );
}
