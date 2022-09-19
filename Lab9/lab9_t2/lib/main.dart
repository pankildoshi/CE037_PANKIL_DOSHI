import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
      title: 'Lab 9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // instead of using home: property we can use initialRoute:
      // home: const Home(),
    );
  }
}
