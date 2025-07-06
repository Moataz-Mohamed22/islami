import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/App_assets.dart';
import '../core/utils/app_styles.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 398.w,
          height: 415.h,
          child: Image.asset(AppAssets.mosque),
        ),
        SizedBox(height: 40.h,),
        Text("Welcome To Islmi App" ,style: AppStyles.bold20primary,),
        SizedBox(height: 40.h,),

        Text("We Are Very Excited To Have You In Our Community" ,textAlign: TextAlign.center,style: AppStyles.bold24primary,),

      ],
    );
  }
}
