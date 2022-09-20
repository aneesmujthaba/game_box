import 'package:flutter/material.dart';
import 'package:game_box/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameBox',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff050B18),
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}
