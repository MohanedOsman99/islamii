import 'package:islami/model/sura.dart';
import 'package:islami/utilits/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SheredPereferencess {
  static void savedata(int suraindex) async {
    ///to use shared pereferernce
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    ///to get last version data from shared ['1','2','114']
    List<String> mostrecentlys = prefs.getStringList('mostrecentlysura') ?? [];
    if (mostrecentlys.contains('${suraindex}')) {
      mostrecentlys.remove('${suraindex}');
      mostrecentlys.add('${suraindex}');
    } else {
      mostrecentlys.add('${suraindex}');
    }

    ///to add the new tab suraindex to list
    mostrecentlys.add('$suraindex');

    ///to save the newest version in sharedpref
    ///to set to not repeat data and return to list
    await prefs.setStringList('mostrecentlysura', mostrecentlys);
  }

  static Future<List<Sura>> getmostrecentdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Sura> recentlydata = [];

    ///to get last version data from shared ['1','2','114']
    List<String> mostrecentlys = prefs.getStringList('mostrecentlysura') ?? [];

    ///بعمل لوب عشان احول اليست بتاعتي لارقام واجيب معلومات الصوره الي قدام رقم الصوره الي ثابت
    for (int i = 0; i < mostrecentlys.length; i++) {
      var suraindex = int.parse(mostrecentlys[i]);
      recentlydata.add(Constants.suras[suraindex]);
    }
    return recentlydata.reversed.toList();
  }
}
