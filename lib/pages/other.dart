import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/user/user_cubit.dart';
import 'package:flutter_states/models/user.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
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
                final user = User(
                  name: "Emir",
                  age: 20,
                  profesiones: ["Developer", "Designer", "Tester", "Scrum Master", "Product Owner"],
                );

                userCubit.changeUser(user);
              },
              color: Colors.blue,
              child: const Text(
                "Establecer Usuario",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userCubit.changeAge(23);
              },
              color: Colors.blue,
              child: const Text(
                "Cambiar Edad",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userCubit.addJob("Flutter Developer");
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("home"),
        child: const Icon(Icons.accessible_sharp),
      ),
    );
  }
}
