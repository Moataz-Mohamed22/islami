import 'package:flutter/material.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/home/Radio/radioTap.dart';
import 'package:islami/home/hadeth/hadethTap.dart';
import 'package:islami/home/Quran/quranTab.dart';
import 'package:islami/home/sebha/sebhaTap.dart';
import 'package:islami/timeTap.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  List<String> bgImages = [
    "assets/images/Quran_bg.png",
    "assets/images/Background.png",
    "assets/images/sebhaBg.png",
    "assets/images/radioBg.png",
    "assets/images/timeBg.png",
  ];
  List<Widget> taps = [
    QuranTab(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.blackColor,
                backgroundColor: AppColors.primaryDark,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtItemeInBottomNavBar(
                          index: 0, imageName: "icon_quran"),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: builtItemeInBottomNavBar(
                          index: 1, imageName: "icon_hadeth"),
                      label: "Hadeth"),
                  BottomNavigationBarItem(
                      icon: builtItemeInBottomNavBar(
                          index: 2, imageName: "sebha"),
                      label: "sebha"),
                  BottomNavigationBarItem(
                      icon: builtItemeInBottomNavBar(
                          index: 3, imageName: "icon_radio"),
                      label: "Radio"),
                  BottomNavigationBarItem(
                      icon: builtItemeInBottomNavBar(
                          index: 4, imageName: "icon_time"),
                      label: "Time")
                ]),
          ),
          body: taps[selectedIndex],
        )
      ],
    );
  }

  Widget builtItemeInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBGColor),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: ImageIcon(AssetImage("assets/images/$imageName.png")))
        : ImageIcon(AssetImage("assets/images/$imageName.png"));
  }
}
