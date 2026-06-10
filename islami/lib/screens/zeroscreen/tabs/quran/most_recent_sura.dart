import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/model/sura.dart';

import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/fonts.dart';
import 'package:islami/utilits/shered_pereference.dart';

class mostrecent extends StatefulWidget {
  final String changed;
  const mostrecent({super.key, required this.changed});

  @override
  State<mostrecent> createState() => _mostrecentState();
}

class _mostrecentState extends State<mostrecent> {
  List<Sura> mostrecentsura = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmostrecent();
  }

  ///get data from shared pereference and save it in list most recent sura
  Future<void> getmostrecent() async {
    mostrecentsura = await SheredPereferencess.getmostrecentdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return mostrecentsura.isEmpty
        ? SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'most recently',
                textAlign: TextAlign.start,
                style: Fonts.white16bolde,
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  itemCount: mostrecentsura.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildmostrecentUi(mostrecentsura[index]);
                  },
                ),
              )
            ],
          );
  }

  Widget buildmostrecentUi(Sura sura) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Appcolor.primary,
      ),
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * .15,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sura.nameen,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(sura.namear,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                Text(
                  '${sura.verses} verses',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Image.asset(images.mostrecen)
          ],
        ),
      ),
    );
  }
}
