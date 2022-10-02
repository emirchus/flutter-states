part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class InitialUserState extends UserState {
  final bool isLogged = false;

  @override
  String toString() {
    return 'InitialUserState{isLogged: $isLogged}';
  }
}

class LoggedUserState extends UserState {
  final bool isLogged = true;
  final User user;

  LoggedUserState(this.user);

  @override
  String toString() {
    return 'LoggedUserState{isLogged: $isLogged}';
  }
}
