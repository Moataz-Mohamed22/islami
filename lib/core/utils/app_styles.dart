import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors.dart';

class AppStyles {
  static TextStyle bold14White = GoogleFonts.elMessiri(
      color: AppColors.whiteColor, fontSize: 14.sp, fontWeight: FontWeight.bold);
  static TextStyle bold16White = GoogleFonts.elMessiri(
      color: AppColors.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle bold20White = GoogleFonts.elMessiri(
      color: AppColors.whiteColor, fontSize: 20.sp, fontWeight: FontWeight.bold);
  static TextStyle bold14black = GoogleFonts.elMessiri(
      color: AppColors.blackColor, fontSize: 14.sp, fontWeight: FontWeight.bold);
  static TextStyle bold24black = GoogleFonts.elMessiri(
      color: AppColors.blackColor, fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle bold24primary = GoogleFonts.elMessiri(
      color: AppColors.primaryDark, fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle bold20primary = GoogleFonts.elMessiri(
      color: AppColors.primaryDark, fontSize: 20.sp, fontWeight: FontWeight.bold);
}
