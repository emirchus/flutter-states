import 'package:flutter/material.dart';
import 'package:flutter_states/services/user_service.dart';

import '../models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder<User?>(
        stream: userService.userStream,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data != null
              ? Center(
                  child: UserInformation(
                  user: snapshot.data!,
                ))
              : const Center(
                  child: Text("No hay usuario"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("other"),
        child: const Icon(Icons.accessible_sharp),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "General",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: const Text("Nombre:"),
            subtitle: Text(user.name),
          ),
          if (user.age != null)
            ListTile(
              title: const Text("Edad:"),
              subtitle: Text(user.age!.toString()),
            ),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ListTile(
            title: Text("Profesor:"),
            subtitle: Text("1 año"),
          ),
        ],
      ),
    );
  }
}
