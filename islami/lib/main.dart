import 'package:flutter/material.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/screens/qurancontent.dart';
import 'package:islami/screens/splash.dart';
import 'package:islami/screens/zeroscreen/zeroscreen.dart';
import 'package:islami/utilits/constants.dart';

void main() {
  for (int i = 0; i < 114; i++) {
    Constants.suras.add(Sura(
        Constants.suraNames[i],
        Constants.englishQuranSurahs[i],
        Constants.versesNumber[i],
        "${i + 1}.txt",
        i));

    ///filename
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "splash": (context) => splashscreen(),
        "zeroscreen": (context) => zeroscreen(),
      },
      initialRoute: "splash",
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
