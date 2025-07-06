import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/appColors.dart';
import '../../core/utils/app_styles.dart';
class SuraContentItem extends StatelessWidget {
  String content;
  int index;
  SuraContentItem({required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryDark, width: 2.w)),
      child: Text(
        textAlign: TextAlign.center,
        "${content} [${index + 1}]",
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
