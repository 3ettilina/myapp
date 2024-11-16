part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileStateLoading extends ProfileState {
  const ProfileStateLoading();
}

class ProfileStateData extends ProfileState {
  const ProfileStateData({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}

class ProfileStateFailure extends ProfileState {
  const ProfileStateFailure({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
