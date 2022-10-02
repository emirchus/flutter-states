import 'dart:async';

import 'package:flutter_states/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User?> _userStreamController = StreamController<User?>.broadcast();

  User? get user => _user;

  bool get isLogged => _user != null;

  Stream<User?> get userStream => _userStreamController.stream;

  void setUser(User? user) {
    _user = user;
    _userStreamController.add(user);
  }

  void setAge(int age) {
    _user!.age = age;
    _userStreamController.add(_user);
  }

  void dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
