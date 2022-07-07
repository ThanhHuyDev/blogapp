import 'package:flutter/material.dart';

import '../../../../../entities/models/user_model.dart';

class PostMoment extends StatelessWidget {
  const PostMoment({Key? key, this.user}) : super(key: key);
  final UserApp? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                            image: NetworkImage(user!.imageUrl![0]),
                            fit: BoxFit.cover)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
