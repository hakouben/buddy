// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:buddy/const.dart';
import 'package:buddy/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

int i = 0;

const qst = [
  "Comment tu t'appelles?",
  "Quelle est ta marque de chocolat préférée?",
  "Qui est l'athlète de haut niveau que tu trouves le plus impressionnant?",
  "Quel est le travail de tes rêves?",
  "Quels sont vos objectifs personnels?",
  "Quelle est la personne la plus cool que vous ayez jamais rencontrée?",
];
List<String> hint = [
  "Ton prénom",
  "Le nom de la marque",
  "Le nom de l’athlète ",
  "",
  "",
  ""
];
var a = ['', '', '', '', '', ''];

class Affichage extends StatelessWidget {
  const Affichage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: couleurPrimaire,
          elevation: 0,
          leading: IconButton(
              iconSize: 2,
              icon: SvgPicture.asset("assets/icon/retour.svg"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }),
        ),
        body: Center(
          child: Container(
              width: 500,
              padding: const EdgeInsets.all(33),
              height: 500,
              child: Center(
                  child: Text(
                      "tu t'appelle ${a[0]},\nt'aimes le chocolat de la marque ${a[1]},\ntu est fan de ${a[2]},\ntu voudrai être un  ${a[3]} \nun d tes objectif est ${a[4]} et tu trouve que ${a[5]} est la personne la plus cool au monde",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))))),
        ));
  }
}

class Pageqst extends StatelessWidget {
  final TextEditingController reponse = TextEditingController();

  Pageqst({super.key});

  String ordinaire(String question, String mot) {
    // ignore: unnecessary_string_interpolations
    var phraseAvecUneCouleurOrdinaire = question.replaceAll('$mot', '');
    return phraseAvecUneCouleurOrdinaire;
  }

  String rouge(String phrase) {
    var motRouge = phrase.split(" ");
    return motRouge[motRouge.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Center(
            child: Container(
                width: 380,
                padding: const EdgeInsets.all(33),
                height: 450,
                child: Column(children: [
                  RichText(
                    text: TextSpan(
                        text: ordinaire(qst[i], rouge(qst[i])),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        children: <TextSpan>[
                          TextSpan(
                              text: rouge(qst[i]),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: couleurTexteRouge,
                                      fontWeight: FontWeight.bold))),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: TextField(
                      controller: reponse,
                      decoration: InputDecoration(
                          hintText: hint[i],
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 80, right: 80)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 20)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          ),
                          onPressed: (() {
                            if (reponse.text == "") {
                            } else if (i >= (qst.length - 1)) {
                              a[i] = reponse.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Affichage())));
                            } else {
                              a[i] = reponse.text;

                              print(a);
                              i++;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Pageqst())));
                            }
                          }),
                          child: Text("Suivant")))
                ]))));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: couleurPrimaire,
      elevation: 0,
      leading: IconButton(
          iconSize: 2,
          icon: SvgPicture.asset("assets/icon/retour.svg"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }),
    );
  }
}
