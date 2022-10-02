import 'package:flutter/material.dart';
import 'package:flutter_states/pages/home.dart';
import 'package:flutter_states/pages/other.dart';
import 'package:flutter_states/services/user_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: "home",
        routes: {
          "home": (_) => const HomePage(),
          "other": (_) => const OtherPage(),
        },
      ),
    );
  }
}
