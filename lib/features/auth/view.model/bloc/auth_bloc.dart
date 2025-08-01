import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebaseapp/data/network/connectivity/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseapp/features/auth/model/user.model.dart';
import 'package:firebaseapp/features/auth/repository/auth_repository.dart';
import 'package:firebaseapp/features/auth/view.model/services/session_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoggedInEvent>(_onLoggedIn);
    on<GoogleLoginEvent>(_onGoogleLoginEvent);
    on<SendEmailVerificationEvent>(_onSendEmailVerificationEvent);
    on<VerifyEmailEvent>(_onVerifyEmailEvent);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
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

  void _onGoogleLoginEvent(
    GoogleLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      final UserModel response = await authRepository.googleLoginApi();

      await SessionController().saveUserInPreference(response);

      emit(AuthenticatedState(user: response));
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onSendEmailVerificationEvent(
    SendEmailVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      await Connection().initConnection();
      if (!Connection().isConnected) throw 'No internet';
      await authRepository.emailVerificationApi();
      emit(EmailVerificationState());
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onResetPasswordEvent(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      await Connection().initConnection();
      if (!Connection().isConnected) throw 'No internet';
      await authRepository.resetPasswordApi(event.email);
      emit(PasswordResetLinkSendState());
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onVerifyEmailEvent(
    VerifyEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      final user = authRepository.getCurrentUserApi();
      if (user != null && user.emailVerified) {
        emit(EmailVerificationSuccessState());
      } else {
        emit(EmailVerificationState());
      }
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onLoggedOut(LoggedOutEvent event, Emitter<AuthState> emit) async {
    await SessionController().clearSession();
    await GoogleSignIn().signOut();
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

  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        final user = await authRepository.reloadUserApi();
        if (user?.emailVerified ?? false) {
          timer.cancel();
          add(VerifyEmailEvent());
        }
      } catch (e, stacktrace) {
        timer.cancel();
        debugPrint(stacktrace.toString());
        add(VerifyEmailEvent());
      }
    });
  }
}
