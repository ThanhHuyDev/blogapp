import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../entities/models/user_model.dart';
import '../../../../../widgets/line.dart';

class PostUser extends StatelessWidget {
  const PostUser({Key? key, this.user, required this.radius}) : super(key: key);

  final UserApp? user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user!.imageUrl![0]),
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
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ReadMoreText(
            'Em oi !\nCo biet dieu gi\nThat dau trong cuoc song muon mau\nEm ak !!!',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            trimLines: 3,
            colorClickableText: Colors.grey,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Xem them',
            trimExpandedText: '',
            moreStyle: TextStyle(
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
                      'https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/254276547_1059567978212241_4678114046598593988_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=U3pCWAPnxOQAX9mN1KS&_nc_ht=scontent.fdad3-6.fna&oh=00_AT9Jz6oiXiXeEE6Ga9VHimaMeb2fJME880Y8Ttyflm3-vA&oe=62C7DE4C'),
                  fit: BoxFit.cover)),
        ),
        Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(Icons.favorite_border),
            SizedBox(
              width: 5,
            ),
            Text('10'),
            SizedBox(
              width: 30,
            ),
            Icon(Icons.messenger_outline),
            SizedBox(
              width: 5,
            ),
            Text('20'),
            Spacer(),
            Text('Thich boi'),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 10,
              child: Text(
                '+10',
                style: TextStyle(fontSize: 8),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Line(),
      ]),
    );
  }
}
