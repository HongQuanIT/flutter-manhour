import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/welcome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Manhour',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/home': (context) => const MyHomePage(title: 'Manhour'),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
