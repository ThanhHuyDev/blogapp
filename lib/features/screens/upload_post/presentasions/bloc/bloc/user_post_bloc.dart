import 'package:equatable/equatable.dart';
import '../../../../../../entities/models/user_model.dart';
import '../../../../../../services/firebase/firestore_reponsitory/post_status/post_status_reponsitory.dart';
import '../../../../onboarding/presentasions/bloc/export_bloc.dart';

part 'user_post_event.dart';
part 'user_post_state.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostState> {
  final PostStatusReponsitory _postStatusReponsitory;
  UserPostBloc({
    required PostStatusReponsitory postStatusReponsitory,
  })  : _postStatusReponsitory = postStatusReponsitory,
        super(Loadingg()) {
    on<LoadUserPosts>(_onLoadPosts);
    on<UpdateUserPosts>(_onUpdatePosts);
  }

  void _onLoadPosts(LoadUserPosts event, Emitter<UserPostState> emit) {
    _postStatusReponsitory
        .getUserPost(event.postId)
        .listen((user) => add(UpdateUserPosts(user: user)));
  }

  void _onUpdatePosts(UpdateUserPosts event, Emitter<UserPostState> emit) {
    emit(Loadedd(user: event.user));
  }
}
