import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/user/user_cubit.dart';
import 'package:flutter_states/models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is InitialUserState) {
            return const Center(
              child: Text("No hay usuario logueado"),
            );
          }

          return Center(
            child: UserInformation(user: (state as LoggedUserState).user),
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
          ListTile(
            title: const Text("Edad:"),
            subtitle: Text(user.age.toString()),
          ),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones
              .map((e) => ListTile(
                    title: Text(e),
                    subtitle: const Text("1 año"),
                  ))
              .toList()
        ],
      ),
    );
  }
}
