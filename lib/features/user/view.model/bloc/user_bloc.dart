import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp/features/auth/model/user.model.dart';
import 'package:erp/features/auth/view.model/services/session_services.dart';
import 'package:erp/features/user/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitialState()) {
    on<LoadUserEvent>(_onLoadUser);
    on<EditUserEvent>(_onEditUser);
  }

  void _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserUpdatingState());
      final user = SessionController().user!;
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState("Failed to load user"));
    }
  }

  void _onEditUser(EditUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserUpdatingState());
      // SessionController().updateUser(event.updatedUser);
      emit(UserLoadedState(event.updatedUser));
    } catch (e) {
      emit(UserErrorState("Failed to update user"));
    }
  }
}
