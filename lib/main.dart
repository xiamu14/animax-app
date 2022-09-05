import 'package:animax/screens/home.dart';
import 'package:animax/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animax Demo',
      theme: ThemeData(
        primaryColor: Color(0xff06C149),
      ),
      home: Home(),
    );
  }
}
