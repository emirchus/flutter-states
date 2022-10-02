import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: userService.userStream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: snapshot.data != null ? Text(snapshot.data!.name) : const Text("No hay usuario"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      final user = User(name: "Emir", age: 20);
                      userService.setUser(user);
                    },
                    color: Colors.blue,
                    child: const Text(
                      "Establecer Usuario",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      final user = userService.user!;
                      userService.setAge((user.age ?? 0) + 1);
                    },
                    color: Colors.blue,
                    child: const Text(
                      "Cambiar Edad",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
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
        });
  }
}
