import 'package:flutter/material.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/screens/qurancontent.dart';
import 'package:islami/screens/zeroscreen/tabs/quran/most_recent_sura.dart';
//import 'package:islami/model/sura_contant_model.dart';
import 'package:islami/utilits/constants.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/fonts.dart';
import 'package:islami/utilits/shered_pereference.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SurasNameRow extends StatefulWidget {
  final Sura sura;
  const SurasNameRow({super.key, required this.sura});
  @override
  State<SurasNameRow> createState() => _SurasNameRowState();
}

class _SurasNameRowState extends State<SurasNameRow> {
  // Take index of listview

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SheredPereferencess.savedata(widget.sura.index);
        //save last sura on click
        String suranameAr = widget.sura.namear;
        String suranameen = widget.sura.nameen;
        String filename = widget.sura.filename;
        //on tap data is saved
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => qurancontent(
                      suranamear: suranameAr,
                      suranameen: suranameen,
                      filename: filename,
                    )));
      },
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images.surasnum), // Ensure this path is valid
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child:
                  Text('${widget.sura.index + 1}', style: Fonts.white20bolde),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.sura.nameen, style: Fonts.white20bolde),
              Text(
                '${widget.sura.verses}',
                style: TextStyle(
                  color: Appcolor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(widget.sura.namear, style: Fonts.white20bolde),
        ],
      ),
    );
  }
}
