import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/home/hadeth/hadethDetalis.dart';
import 'package:islami/model/hadetModel.dart';

class Hadethtap extends StatefulWidget {
  @override
  State<Hadethtap> createState() => _HadethtapState();
}

class _HadethtapState extends State<Hadethtap> {
  List<HadethModel> hadethList = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
      children: [
        Image.asset(
          "assets/images/Logo_quran.png",
        ),
        hadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryDark,
                ),
              )
            : CarouselSlider.builder(
                itemCount: hadethList.length,
                options: CarouselOptions(
                    height: height * 0.63,
                    viewportFraction: 0.75,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true),
                itemBuilder: (BuildContext, int itemIndex, int pedgViewIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(HadethDetalis.routeName,
                          arguments: hadethList[itemIndex]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.primaryDark,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/HadethBg.png"),
                          )),
                      child: Column(
                        children: [
                          Text(
                            hadethList[itemIndex].titel,
                            style: TextStyle(
                                color: AppColors.blackColor, fontSize: 24),
                          ),
                          Expanded(
                              child: Text(
                            hadethList[itemIndex].Content.join(""),
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  );
                }),
      ],
    ));
  }

  Future<void> loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      List<String> hadethLines = hadethContent.split("\n");
      for (String line in hadethLines) {
        print(line);
      }
      String titel = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(titel: titel, Content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
