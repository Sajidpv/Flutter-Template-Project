part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final UserModel user;

  AuthenticatedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class EmailVerificationState extends AuthState {
  EmailVerificationState();

  @override
  List<Object?> get props => [];
}

class PasswordResetLinkSendState extends AuthState {
  PasswordResetLinkSendState();

  @override
  List<Object?> get props => [];
}

class EmailVerificationSuccessState extends AuthState {
  EmailVerificationSuccessState();

  @override
  List<Object?> get props => [];
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class AuthSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
