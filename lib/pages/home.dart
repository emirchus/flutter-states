import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: userService.logOut,
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: userService.isLoggedIn
          ? Center(
              child: UserInformation(
                user: userService.user!,
              ),
            )
          : const Center(
              child: Text("No user logged in"),
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
          ListTile(
            title: const Text("Edad:"),
            subtitle: Text((user.age).toString()),
          ),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones
              .map<Widget>((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()
        ],
      ),
    );
  }
}
