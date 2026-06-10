import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/screens/zeroscreen/tabs/quran/most_recent_sura.dart';
import 'package:islami/screens/zeroscreen/tabs/quran/suras_name_row.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/constants.dart';
import 'package:islami/utilits/fonts.dart';

class qurantab extends StatefulWidget {
  const qurantab({super.key, x});

  @override
  State<qurantab> createState() => _qurantabState();
}

class _qurantabState extends State<qurantab> {
  String usertext = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        width: double.infinity,

        ///poto has all size of screen
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(images.qurancover), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset(images.quranlogo),
              buildtextfield(),
              SizedBox(
                height: 15,
              ),
              usertext.isNotEmpty
                  ? SizedBox()
                  : mostrecent(
                      changed: usertext,
                    ),
              Text(
                'Suras List',
                style: Fonts.white16bolde,
              ),
              buildsuraslistview(),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildsuraslistview() {
    List<Sura> filteredsura = [];
    filteredsura = Constants.suras.where(
      (Sura) {
        return Sura.namear.contains(usertext) ||
            Sura.nameen.toLowerCase().contains(usertext.toLowerCase());
      },
    ).toList();
    return ListView.separated(
      ///to make line between widget
      itemCount: filteredsura.length,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SurasNameRow(
          sura: filteredsura[index],
        );
      },
      separatorBuilder: (context, index) => Divider(),

      ///to make seperated line between builder or widget
    );
  }

  Widget buildtextfield() {
    OutlineInputBorder borderr = OutlineInputBorder(
      borderSide: BorderSide(color: Appcolor.primary, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
        decoration: InputDecoration(
            border: borderr,
            focusedBorder: borderr,
            labelText: 'Sura Name',
            labelStyle: Fonts.white23bolde,
            prefixIcon: Container(
              margin: EdgeInsets.symmetric(vertical: 11),
              child: Image.asset(
                images.quranicon,
                color: Appcolor.primary,
              ),
            )),
        onChanged: (changeintextfield) {
          usertext = changeintextfield;
          setState(() {});
        },
        cursorColor: Appcolor.white,
        style: Fonts.white23bolde);
  }
}
