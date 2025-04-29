import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/features/auth/model/user.model.dart';
import 'package:stock_shift_pro/features/auth/repository/auth_repository.dart';
import 'package:stock_shift_pro/features/auth/view.model/services/session_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoggedInEvent>(_onLoggedIn);
    on<LoggedOutEvent>(_onLoggedOut);
    on<SignUpEvent>(_onSignUp);
  }

  void _onAppStarted(AppStartedEvent event, Emitter<AuthState> emit) async {
    await SessionController().getUserFromPreference();
    print(SessionController().isLoggedIn);
    if (SessionController().isLoggedIn && SessionController().role != null) {
      emit(
        AuthenticatedState(
          user: SessionController().user!,
          token: SessionController().token ?? '',
        ),
      );
    } else {
      emit(UnauthenticatedState());
    }
  }

  void _onLoggedIn(LoggedInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final UserResponse response = await authRepository.loginApi({
        'mobile': event.mobile,
        'password': event.password,
      });
      await SessionController().saveUserInPreference(response);
      emit(AuthenticatedState(user: response.user!, token: response.token!));
    } catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      emit(AuthErrorState(error: e.toString()));
    }
  }

  void _onLoggedOut(LoggedOutEvent event, Emitter<AuthState> emit) async {
    await SessionController().clearSession();
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
