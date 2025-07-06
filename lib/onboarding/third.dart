import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/App_assets.dart';
import '../core/utils/app_styles.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 398.w,
          height: 415.h,
          child: Image.asset(AppAssets.holyQuran),
        ),
        SizedBox(height: 40.h,),
        Text("Reading the Quran" ,style: AppStyles.bold20primary,),
        SizedBox(height: 40.h,),

        Text("Read, and your Lord is the Most Generous" ,textAlign: TextAlign.center,style: AppStyles.bold24primary,),

      ],
    );
  }
}
