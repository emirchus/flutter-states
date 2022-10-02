import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';
import 'package:provider/provider.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userService.user = User(name: "Emir", age: 20, profesiones: [
                  "Developer",
                  "Designer",
                  "Tester",
                ]);
              },
              color: Colors.blue,
              child: const Text(
                "Establecer Usuario",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final user = userService.user;
                userService.changeAge(user!.age + 1);
              },
              color: Colors.blue,
              child: const Text(
                "Cambiar Edad",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userService.addProfesion("New Profession");
              },
              color: Colors.blue,
              child: const Text(
                "Añadir Profesión",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
