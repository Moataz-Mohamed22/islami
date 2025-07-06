import 'package:flutter/material.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/core/utils/app_routs.dart';
import 'package:islami/home/Quran/SuraDetalisScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/home/Quran/quranTab.dart';
import 'package:islami/home/Radio/radioTap.dart';
import 'package:islami/home/hadeth/hadethTap.dart';
import 'package:islami/home/sebha/sebhaTap.dart';
import 'package:islami/onboarding/first.dart';
import 'package:islami/onboarding/onboarding_screen.dart';
import 'package:islami/onboarding/second.dart';
import 'package:islami/onboarding/third.dart';
import 'package:islami/timeTap.dart';

import 'core/utils/MyTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),

    builder: (_ , child) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouts.onboarding,
          routes: {
         AppRouts.homeScreen: (context)=>Homescreen(),
            AppRouts.quranScreen: (context)=>QuranTab(),
         AppRouts.sebhaScreen: (context)=>SebhaTab(),
         AppRouts.hadethScreen: (context)=>HadethTab(),
         AppRouts.radioScreen: (context)=>RadioTab(),
         AppRouts.timeScreen: (context)=>TimeTab(),
         AppRouts.onboarding: (context)=>OnboardingScreen(),
         AppRouts.firstOnboarding: (context)=>FirstScreen(),
         AppRouts.secondOnboarding: (context)=>SecondScreen(),
         AppRouts.thirdOnboarding: (context)=>ThirdScreen(),
            },


          darkTheme: MyTheme.darkTheme,
          themeMode: ThemeMode.dark);}
    );
  }
}
