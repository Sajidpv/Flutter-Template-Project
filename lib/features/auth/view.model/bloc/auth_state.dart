part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final UserModel user;
  final String token;

  AuthenticatedState({required this.user, required this.token});

  @override
  List<Object?> get props => [user, token];
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
