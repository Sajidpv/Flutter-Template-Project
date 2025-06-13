import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseapp/features/auth/model/user.model.dart';
import 'package:firebaseapp/features/auth/repository/auth_repository.dart';
import 'package:firebaseapp/features/auth/view.model/services/session_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoggedInEvent>(_onLoggedIn);
    on<EmailVerificationEvent>(_onEmailVerificationEvent);
    on<LoggedOutEvent>(_onLoggedOut);
    on<SignUpEvent>(_onSignUp);
  }

  void _onAppStarted(AppStartedEvent event, Emitter<AuthState> emit) async {
    await SessionController().getUserFromPreference();
    if (SessionController().isLoggedIn) {
      if (SessionController().isVerified == true) {
        emit(AuthenticatedState(user: SessionController().user!));
      } else {
        emit(EmailVerificationState());
      }
    } else {
      emit(UnauthenticatedState());
    }
  }

  void _onLoggedIn(LoggedInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final UserModel response = await authRepository.loginApi(
        event.email,
        event.password,
      );
      await SessionController().saveUserInPreference(response);

      emit(AuthenticatedState(user: response));
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onEmailVerificationEvent(
    EmailVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      await authRepository.emailVerificationApi();
      emit(EmailVerificationState());
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onLoggedOut(LoggedOutEvent event, Emitter<AuthState> emit) async {
    await SessionController().clearSession();
    await authRepository.logoutApi();
    emit(UnauthenticatedState());
  }

  void _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.registerApi(event.user.toJson());
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }
  }
}
