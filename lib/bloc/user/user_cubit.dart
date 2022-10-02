import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUserState());

  void changeUser(User user) {
    emit(LoggedUserState(user));
  }

  void changeAge(int age) {
    if (state is LoggedUserState) {
      final user = (state as LoggedUserState).user;
      emit(LoggedUserState(user.copyWith(age: age)));
    }
  }

  void addJob(String job) {
    if (state is LoggedUserState) {
      final user = (state as LoggedUserState).user;
      emit(LoggedUserState(user.copyWith(profesiones: [...user.profesiones, job])));
    }
  }
}
