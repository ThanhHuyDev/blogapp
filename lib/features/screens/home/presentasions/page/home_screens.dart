import 'package:blogapp/entities/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
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
            _listPostUser(context, User.users[0]),
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

  _listPostUser(BuildContext context, User user) {
    return Column(
      children: List.generate(5, (index) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          margin: const EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user.imageUrl[0]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Giang Thanh Huy'),
                        Text('30/06/2022'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ReadMoreText(
                'Em oi !\nCo biet dieu gi\nThat dau trong cuoc song muon mau\nEm ak !!!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                trimLines: 3,
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Xem them',
                trimExpandedText: '',
                moreStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/286844706_3252252478379777_289344572277365177_n.jpg?stp=dst-jpg_p526x296&_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=BordxciqTqsAX8-wRkh&_nc_ht=scontent.fdad3-6.fna&oh=00_AT8jJNhFWv4AYKb7pZFmSNbl1f-qqLqvWNgtgqtIVKqWTg&oe=62C15789'),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.favorite_border),
                const SizedBox(
                  width: 5,
                ),
                const Text('10'),
                const SizedBox(
                  width: 30,
                ),
                const Icon(Icons.messenger_outline),
                const SizedBox(
                  width: 5,
                ),
                const Text('20'),
                const Spacer(),
                const Text('Thich boi'),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey[300],
                  child: const Text(
                    '+10',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            )
          ]),
        );
      }),
    );
  }
}
