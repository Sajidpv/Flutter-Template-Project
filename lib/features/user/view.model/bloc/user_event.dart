part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class EditUserEvent extends UserEvent {
  final UserModel updatedUser;
  EditUserEvent(this.updatedUser);
  @override
  List<Object?> get props => [updatedUser];
}
