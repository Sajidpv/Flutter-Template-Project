part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final UserModel user;
  UserLoadedState(this.user);
  @override
  List<Object?> get props => [user];
}

class UserUpdatingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
