import 'package:equatable/equatable.dart';

import '../../../../../../entities/models/post_model.dart';
import '../../../../../../entities/models/user_model.dart';
import '../../../../../../services/firebase/firestore_reponsitory/post_status/post_status_reponsitory.dart';
import '../../../../onboarding/presentasions/bloc/export_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostStatusReponsitory _postStatusReponsitory;
  PostBloc({
    required PostStatusReponsitory postStatusReponsitory,
  })  : _postStatusReponsitory = postStatusReponsitory,
        super(Loading()) {
    on<LoadPosts>(_onLoadPosts);
    on<UpdatePosts>(_onUpdatePosts);
  }

  void _onLoadPosts(LoadPosts event, Emitter<PostState> emit) {
    _postStatusReponsitory.getPostHome().listen((post) {
      _postStatusReponsitory.getUserPost(event.postId).listen(
        (user) {
          add(UpdatePosts(posts: post, user: user));
        },
      );
    });
  }

  void _onUpdatePosts(UpdatePosts event, Emitter<PostState> emit) {
    emit(Loaded(posts: event.posts, user: event.user));
  }
}
