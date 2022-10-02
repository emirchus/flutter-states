import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void addProfesion(String profesion) {
    _user!.profesiones.add(profesion);
    notifyListeners();
  }

  void logOut() {
    _user = null;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
