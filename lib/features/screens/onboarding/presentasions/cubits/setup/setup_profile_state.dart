// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setup_profile_cubit.dart';

enum SetupStatus {
  initial,
  profileUpdateInProgress,
  profileUpdateComplete,
}

class SetupProfileState extends Equatable {
  final UserApp? user;
  final SetupStatus status;
  const SetupProfileState({this.user, required this.status});

  @override
  List<Object> get props => [user!];

  SetupProfileState copyWith({UserApp? user, SetupStatus? status}) {
    return SetupProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
