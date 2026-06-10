import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/fonts.dart';

class qurancontent extends StatefulWidget {
  // String suracontent = '';
  final String suranamear;
  final String suranameen;
  final String filename;
  const qurancontent(
      {super.key,
      required this.suranamear,
      required this.suranameen,
      required this.filename});

  @override
  State<qurancontent> createState() => _qurancontentState();
}

class _qurancontentState extends State<qurancontent> {
  String filecontent = '';
  @override
  Widget build(BuildContext context) {
    if (filecontent.isEmpty) getsuracontent(widget.filename);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Appcolor.blackwhite,
        title: Text(widget.suranameen, style: Fonts.primary20bold),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.suranamear, style: Fonts.primary24bold),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(filecontent,
                    textDirection: TextDirection.rtl,

                    ///arabic
                    textAlign: TextAlign.center,
                    style: Fonts.primary20bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getsuracontent(String filename) async {
    Future<String> future =
        rootBundle.loadString('assets/files/suras/$filename');
    filecontent = await future;
    setState(() {});
    List<String> suralines = filecontent.trim().split('\n');
    for (int i = 0; i < suralines.length; i++) {
      suralines[i] += "[${i + 1}]";
      filecontent = suralines.join();
    }
  }
}
