import 'package:blogapp/entities/models/user_model.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final User user;
  final VoidCallback press;
  const PostCard({Key? key, required this.user, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 7,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.imageUrl[0]),
              ),
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: press,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 7, right: 30, left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${user.name} oi, hom nay ban the nao ?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black45),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
