import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/App_assets.dart';
import 'package:islami/core/utils/app_styles.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          child: Image.asset(AppAssets.marhaba),
        ),
        SizedBox(height: 80.h,),
        Text("Welcome To Islmi App" ,style: AppStyles.bold24primary,)

      ],
    );
  }
}
