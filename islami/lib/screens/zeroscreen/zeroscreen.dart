import 'package:flutter/material.dart';
import 'package:islami/screens/zeroscreen/tabs/ahadis/ahadis.dart';
import 'package:islami/screens/zeroscreen/tabs/praytime/praytime.dart';
import 'package:islami/screens/zeroscreen/tabs/quran/quran.dart';
import 'package:islami/screens/zeroscreen/tabs/radio/radio.dart';
import 'package:islami/screens/zeroscreen/tabs/sebha/sebha.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';

class zeroscreen extends StatefulWidget {
  const zeroscreen({super.key});

  @override
  State<zeroscreen> createState() => _zeroscreenState();
}

class _zeroscreenState extends State<zeroscreen> {
  int currenttapindex = 0;
  List<Widget> tabs = [
    qurantab(),
    ahadistab(),
    sebhatab(),
    radiotab(),
    praytimetab(),
  ];
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: buildBottomnavigationbar(),
        body: PageView(
          onPageChanged: (index) {
            currenttapindex = index;
            setState(() {});
          },
          controller: controller,
          children: tabs,
        ),
      ),
    );
  }

  Widget buildBottomnavigationbar() {
    return Theme(
      data: ThemeData(canvasColor: Appcolor.primary),

      ///to change color in bottom navigationbar
      child: BottomNavigationBar(
          selectedItemColor: Appcolor.white,
          unselectedItemColor: Appcolor.black,
          onTap: (clickedtabindex) {
            currenttapindex = clickedtabindex;
            controller.animateToPage(currenttapindex,
                curve: Curves.easeInCirc,
                duration: Duration(milliseconds: 500));
            setState(() {});

            ///
          },
          currentIndex: currenttapindex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(images.quranicon), label: 'quran'),
            BottomNavigationBarItem(
                icon: Image.asset(images.ahadisicon), label: 'ahadis'),
            BottomNavigationBarItem(
                icon: Image.asset(images.sebhaicon), label: 'sebha'),
            BottomNavigationBarItem(
                icon: Image.asset(images.Radioicon), label: 'radio'),
            BottomNavigationBarItem(
                icon: Image.asset(images.soundicon), label: 'pray time'),
          ]),
    );
  }

  ///func
}
