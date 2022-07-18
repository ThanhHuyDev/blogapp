import 'package:blogapp/features/screens/home/presentasions/widgets/post_user.dart';
import 'package:flutter/material.dart';
import '../../../settings/presentasions/bloc/export_bloc.dart';
import '../../../upload_post/presentasions/bloc/post/post_bloc.dart';

class ListPost extends StatelessWidget {
  const ListPost({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Loaded) {
          return Column(
            children: List.generate(state.posts.length, (index) {
              context
                  .read<PostBloc>()
                  .add(LoadPosts(postId: state.posts[index].idUser!));
              return PostUser(
                user: state.user,
                post: state.posts[index],
                radius: 0,
              );
            }),
          );
        } else {
          return const Center(
            child: Text('something went wrong !'),
          );
        }
      },
    );
  }
}
