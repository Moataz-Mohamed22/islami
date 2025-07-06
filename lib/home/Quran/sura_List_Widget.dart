import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/SuraModel.dart';

import '../../core/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;
  SuraListWidget({required this.suraModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/Vector_image.png"),
            Text(
              "${index + 1}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text("${suraModel.suraEnName}",
                        style: AppStyles.bold20White),
                  ),
                  Text(
                    "${suraModel.numberOfVerses} Verses",
                    style: AppStyles.bold16White,
                  ),
                ],
              ),
            ],
          ),
        ),
        Text("${suraModel.suraArName}", style: AppStyles.bold16White),
      ],
    );
  }
}
