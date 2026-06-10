import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/haidius.dart';
import 'package:islami/screens/zeroscreen/tabs/ahadis/ahadiscontent.dart';
import 'package:islami/utilits/assets.dart';
import 'package:islami/utilits/colors.dart';
import 'package:islami/utilits/fonts.dart';

class ahadistab extends StatefulWidget {
  ahadistab({super.key});

  @override
  State<ahadistab> createState() => _ahadistabState();
}

class _ahadistabState extends State<ahadistab> {
  List<Haidius> haiduislist = [];
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    loadhadiusdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images.ahadisbackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(images.quranlogo),
          Expanded(
            child: isLoading
                ? Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator
                : CarouselSlider.builder(
                    itemCount: haiduislist.length,
                    itemBuilder: (context, index, pageviewindex) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => hadiscontent(
                                          haidiussss: haiduislist[index],
                                        )));
                          },
                          child: builahadiuscontainer(index));
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: double.infinity,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget builahadiuscontainer(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Appcolor.primary,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                images.blackright,
                height: 72,
              ),
              Text(
                haiduislist[index].title,
                style: Fonts.black16bold,
              ),
              Image.asset(
                images.blackleft,
                height: 72,
              )
            ],
          ),
          Text(
            haiduislist[index].content.join(''),
            style: Fonts.black16bold,
            maxLines: 12,
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Future<void> loadhadiusdata() async {
    for (int i = 1; i <= 50; i++) {
      if (!mounted) return; // Stop execution if the widget is disposed

      String hadius = await rootBundle.loadString('assets/files/suras/h$i.txt');
      List<String> haidiuslines = hadius.split('\n');

      if (haidiuslines.isNotEmpty) {
        String title = haidiuslines.removeAt(0);
        Haidius haduismodel = Haidius(title: title, content: haidiuslines);
        haiduislist.add(haduismodel);
      }
    }

    if (mounted) {
      // Check before calling setState
      setState(() {
        isLoading = false;
      });
    }
  }
}
