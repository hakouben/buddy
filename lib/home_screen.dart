// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:buddy/const.dart';
import 'package:buddy/page1.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/image/yeah.jpg"),
          ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 23)),
                backgroundColor: MaterialStateProperty.all(couleurTexteRouge),
              ),
              onPressed: (() {
                Navigator.push(
                    // ignore: prefer_const_constructors
                    context,
                    MaterialPageRoute(builder: (context) => Page1()));
              }),
              child: Text('Faisons connaissance !'))
        ],
      )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: couleurTexteRouge,
      centerTitle: true,
      // ignore: prefer_const_constructors
      title: Text("Buddy App"),
      elevation: 0,
    );
  }
}
