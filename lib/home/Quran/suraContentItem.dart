import 'package:flutter/material.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/utils/app_styles.dart';

// ignore: must_be_immutable
class SuraContentItem extends StatelessWidget {
  String content;
  int index;
  SuraContentItem({required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryDark, width: 2)),
      child: Text(
        textAlign: TextAlign.center,
        "${content} [${index + 1}]",
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
