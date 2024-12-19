import 'package:flutter/material.dart';
import 'package:islami/utils/appColors.dart';

class RadioTap extends StatefulWidget {
  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  int selectedButton = 0;

  List<String> radioStations = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokan Mohammad Alalim"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          SizedBox(height: 40),
          Center(
            child: Text(
              "Islami",
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonBuilder("Radio", 0),
              SizedBox(width: 10),
              buttonBuilder("Reciters", 1),
            ],
          ),
          SizedBox(height: 10),

          // Radio Cards
          Expanded(
            child: ListView.builder(
              itemCount: radioStations.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        radioStations[index],
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border,
                              size: 28, color: AppColors.blackColor),
                          SizedBox(width: 20),
                          Icon(Icons.play_circle_fill,
                              size: 36, color: AppColors.blackColor),
                          SizedBox(width: 20),
                          Icon(Icons.volume_up,
                              size: 28, color: AppColors.blackColor),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Custom Button Builder
  Widget buttonBuilder(String title, int buttonIndex) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedButton = buttonIndex;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedButton == buttonIndex
              ? AppColors.primaryDark
              : AppColors.blackColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedButton == buttonIndex
                ? AppColors.blackColor
                : AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
