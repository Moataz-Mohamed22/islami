import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/Quran/suraContentItem.dart';
import 'package:islami/model/SuraModel.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/app_styles.dart';

class SuraDetalisScreen extends StatefulWidget {
  static String routeName = "Sura_detalis";

  @override
  State<SuraDetalisScreen> createState() => _SuraDetalisScreenState();
}

class _SuraDetalisScreenState extends State<SuraDetalisScreen> {
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
      if (verses.isEmpty) {
        loadSuraFile(args.fileName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnName,
          style: AppStyles.bold24primary,
        ),
      ),
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
              Text("${args.suraArName}", style: AppStyles.bold24primary),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString("assets/files/Suras/$fileName");
    List<String> suraLines = suraContent.split("\n");
    setState(() {
      verses = suraLines;
    });
  }
}
