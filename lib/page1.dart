// ignore_for_file: prefer_const_constructors

import 'package:buddy/const.dart';
import 'package:buddy/home_screen.dart';
import 'package:buddy/page_qst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Center(
            // ignore: sized_box_for_whitespace
            child: Container(
                width: 450,
                height: 300,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "BONJOUR , AUJOURD'HUI JE VAIS TE POSER QUELQUES QUESTIONS À FIN DE MIEUX TE CONNAÎTRE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: couleurTexte,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(20)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 23)),
                              backgroundColor:
                                  MaterialStateProperty.all(couleurTexteRouge),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pageqst()));
                            }),
                            child: Text("C'EST PARTI !!")))
                  ],
                )))));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: couleurPrimaire,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icon/icons8-home.svg"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }),
    );
  }
}
