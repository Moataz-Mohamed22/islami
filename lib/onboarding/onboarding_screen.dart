import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/App_assets.dart';
import 'package:islami/core/utils/appColors.dart';
import 'package:islami/core/utils/app_routs.dart';
import 'package:islami/onboarding/Fourth.dart';
import 'package:islami/onboarding/fifth.dart';
import 'package:islami/onboarding/first.dart';
import 'package:islami/onboarding/second.dart';
import 'package:islami/onboarding/third.dart';

class OnboardingScreen extends StatefulWidget {


  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

}

class _OnboardingScreenState extends State<OnboardingScreen> {
final  PageController _controller =PageController();
  int index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        toolbarHeight: 170.h,
        title: Image.asset(AppAssets.backgroundOnboard1),

      ),
      body: Column(
          children: [
          Expanded(
          child: PageView(
      controller: _controller,
      onPageChanged: (i) {
        setState(() {
          index = i;
        });
      },
      children: const [
        FirstScreen(),
        SecondScreen(),
        ThirdScreen(),
        FourthScreen(),
        FifthScreen(),
      ],
          ),
          ),

          SizedBox(height: 20.h),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
          return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: index == i ? 14.w : 8.w,
          height: index == i ? 14.w : 8.w,
          decoration: BoxDecoration(
          color: index == i ? AppColors.primaryDark : Colors.grey,
          shape: BoxShape.circle,
          ));}) ),

          SizedBox(height: 30.h),

          // 3. Navigation buttons
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          TextButton(
          onPressed: index > 0
          ? () {
          _controller.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          );
          }
        : null,
          child: Text("Back", style: TextStyle(color:AppColors.whiteColor)),
          ),

          if (index == 4)
          ElevatedButton(
          onPressed: () {
          Navigator.pushReplacementNamed(context, AppRouts.homeScreen);
          },
          style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.blackColor,
          ),
          child: Text("Get Started"),
          )
          else
          TextButton(
          onPressed: () {
          _controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          );
          },
          child: Text("Next", style: TextStyle(color: AppColors.whiteColor)),
          )]))]),
    );
  }
}
