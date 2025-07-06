import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/App_assets.dart';
import '../core/utils/app_styles.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            // width: 398.w,
            // height: 415.h,
            child: Image.asset(AppAssets.holyQuranRadio),
          ),
        ),
        SizedBox(height: 40.h,),
        Text("Holy Quran Radio" ,style: AppStyles.bold20primary,),
        SizedBox(height: 40.h,),

        Text("You can listen to the Holy Quran Radio through the application for free and easily" ,textAlign: TextAlign.center,style: AppStyles.bold24primary,),

      ],
    );
  }
}
