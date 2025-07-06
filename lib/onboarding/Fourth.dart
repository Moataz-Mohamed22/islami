import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/App_assets.dart';
import '../core/utils/app_styles.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 398.w,
          height: 415.h,
          child: Image.asset(AppAssets.prayer),
        ),
        SizedBox(height: 40.h,),
        Text("Bearish" ,style: AppStyles.bold20primary,),
        SizedBox(height: 40.h,),

        Text("Praise the name of your Lord, the Most High" ,textAlign: TextAlign.center,style: AppStyles.bold24primary,),

      ],
    );
  }
}
