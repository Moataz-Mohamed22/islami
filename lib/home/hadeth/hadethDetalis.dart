import 'package:flutter/material.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/model/hadetModel.dart';

class HadethDetalis extends StatelessWidget {
  static const String routeName = "Hadeth Detalis";
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackBGColor,
            child: Image.asset(
              "assets/images/detalis_Bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.titel,
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        args.Content[index],
                        style: TextStyle(
                            color: AppColors.primaryDark, fontSize: 18),
                      ),
                    );
                  },
                  itemCount: args.Content.length,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
