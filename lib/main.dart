import 'package:flutter/material.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/utils/MyTheme.dart';
import 'package:islami/home/Quran/SuraDetalisScreen.dart';
import 'package:islami/home/hadeth/hadethDetalis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Homescreen.routeName,
        routes: {
          Homescreen.routeName: (context) {
            return Homescreen();
          },
          SuraDetalisScreen.routeName: (context) {
            return SuraDetalisScreen();
          },
          HadethDetails.routeName: (context) {
            return HadethDetails();
          }
        },
        darkTheme: Mytheme.darkTheme,
        themeMode: ThemeMode.dark);
  }
}
