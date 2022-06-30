import 'package:blogapp/entities/models/user_model.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            Expanded(
                child: SvgPicture.asset(
              'assets/images/logo.png',
              height: 50,
            )),
            Expanded(
                flex: 2,
                child: Text(
                  'BLOGGER',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.deepPurple),
                ))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            PostCard(
              user: User.users[0],
              press: () {},
            ),
            _listPostMoment(context, User.users[0]),
            _listPostUser(),
          ],
        ),
      ),
    );
  }

  _listPostMoment(BuildContext context, User user) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Khoanh khac',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 90,
                    margin:
                        const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(user.imageUrl[0]),
                            fit: BoxFit.cover)),
                  );
                }),
          )
        ],
      ),
    );
  }

  _listPostUser() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        });
  }
}
