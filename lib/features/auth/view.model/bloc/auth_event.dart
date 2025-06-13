part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class AppStartedEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthEvent {
  final String email;
  final String password;

  LoggedInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class EmailVerificationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final UserModel user;
  SignUpEvent({required this.user});
  @override
  List<Object?> get props => [user];
}
