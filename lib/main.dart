import 'package:buddy/const.dart';
import 'package:buddy/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buddy APP',
      theme: ThemeData(
        scaffoldBackgroundColor: couleurPrimaire,
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
