import 'package:flutter/material.dart';
import 'package:islami/model/haidius.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/fonts.dart';

class hadiscontent extends StatelessWidget {
  final Haidius haidiussss;
  hadiscontent({super.key, required this.haidiussss});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Appcolor.blackwhite,
        appBar: AppBar(
          backgroundColor: Appcolor.blackwhite,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Appcolor.primary,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    images.blackright,
                    color: Appcolor.primary,
                  ),
                  Text(haidiussss.title, style: Fonts.primary24bold),
                  Image.asset(
                    images.blackleft,
                    color: Appcolor.primary,
                  )
                ],
              ),
              Text(
                haidiussss.content.join(''),
                style: Fonts.primary20bold,
                maxLines: 12,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Image.asset(images.suracontentimg)
            ],
          ),
        ),
      ),
    );
  }
}
