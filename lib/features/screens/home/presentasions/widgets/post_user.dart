import 'package:blogapp/features/screens/upload_post/presentasions/bloc/bloc/user_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import '../../../../../entities/models/post_model.dart';
import '../../../../../entities/models/user_model.dart';
import '../../../../../widgets/line.dart';

class PostUser extends StatelessWidget {
  const PostUser(
      {Key? key, required this.radius, required this.post, required this.user})
      : super(key: key);

  final Post post;
  final double radius;
  final UserApp user;

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
                backgroundImage: NetworkImage(user.imageAvatar),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.fullName),
                    Text(post.time!),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ReadMoreText(
            post.caption!,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            trimLines: 3,
            colorClickableText: Colors.grey,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Xem thêm',
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(post.imagePost!), fit: BoxFit.cover)),
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
        const Line(
          height: 4,
        ),
      ]),
    );
  }
}
