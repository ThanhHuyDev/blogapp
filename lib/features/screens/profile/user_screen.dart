import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/home/presentasions/widgets/post_user.dart';
import 'package:blogapp/features/screens/settings/presentasions/page/setting_screen.dart';
import 'package:blogapp/features/screens/profile/edit_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserScreens extends StatefulWidget {
  static const String routeName = '/users';

  const UserScreens({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const UserScreens());
  }

  @override
  State<UserScreens> createState() => _UserScreensState();
}

class _UserScreensState extends State<UserScreens>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 2, vsync: this);
    UserApp? user = UserApp.users[0];
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              user.imageUrl![0],
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Text('♪${user.fullName} ♥'),
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
                  Navigator.pushNamed(context, SettingScreen.routeName);
                },
                icon: SvgPicture.asset(
                  'assets/icons/ic_setting.svg',
                  color: Colors.white,
                  height: 25,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditUserScreens.routeName);
                },
                icon: SvgPicture.asset(
                  'assets/icons/ic_edit.svg',
                  color: Colors.white,
                  height: 25,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: _buildDetailUser(user, _tabController),
        )
      ],
    ));
  }

  Widget _buildDetailUser(UserApp user, TabController _tabController) =>
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.imageUrl![0]),
                ),
              ),
              Center(
                child: Text(
                  user.status,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'tuong ca nhan',
                      ),
                      Tab(
                        text: 'bai dang da luu',
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: double.infinity,
                height: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    children: List.generate(
                        3,
                        (index) => PostUser(
                              user: user,
                              radius: 10,
                            )),
                  ),
                  Column(
                    children: List.generate(
                        3,
                        (index) => PostUser(
                              user: user,
                              radius: 10,
                            )),
                  )
                ]),
              ),
            ],
          ),
        ),
      );
}
