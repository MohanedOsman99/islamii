import 'package:flutter/material.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/fonts.dart';

class sebhatab extends StatefulWidget {
  const sebhatab({super.key});

  @override
  State<sebhatab> createState() => _sebhatabState();
}

class _sebhatabState extends State<sebhatab> {
  int count = 0;
  List<String> sebha = ['سَبِّحِ اسْمَ رَبِّكَ الأعلى ', 'سبحان الله'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(images.sebhacover), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Image.asset(images.quranlogo),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                style: Fonts.white36bolde,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  images.sebhabody,
                ))),
                child: IconButton(
                  onPressed: () {
                    ++count;
                    setState(() {});
                  },
                  icon: Column(
                    children: [
                      Center(
                        child: Text(
                          'سبحان الله',
                          style: Fonts.white36bolde,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Center(
                        child: Text(
                          '$count',
                          style: Fonts.white23bolde,
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
