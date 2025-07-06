import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  String azkar = "سبحان الله";
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/Logo_quran.png"),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                count++;
                turns += 0.05;
                if (count <= 33) {
                  azkar = "سبحان الله";
                } else if (count <= 66) {
                  azkar = "الله أكبر";
                } else if (count <= 99) {
                  azkar = "الحمدلله";
                } else if (count == 100) {
                  azkar = "جزاك الله خيراً! ابدأ من جديد";
                  count = 0;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                    turns: turns,
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/images/sebhaImge.png")),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      azkar,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "$count",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
