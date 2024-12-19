import 'package:flutter/material.dart';
import 'package:islami/home/Quran/SuraDetalisScreen.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/home/Quran/sura_List_Widget.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

@override
class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraArName: SuraModel.suraArabicNameList[i],
          suraEnName: SuraModel.surEnglishNameList[i],
          numberOfVerses: SuraModel.numberOfVersesList[i],
          fileName: "${i + 1}.txt"));
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchText = "";
  Map<String, String> lastSura = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/Logo_quran.png"),
              TextField(
                style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                onChanged: (text) {
                  searchText = text;
                  filterList = SuraModel.suraList.where((sura) {
                    return sura.suraArName.contains(searchText) ||
                        sura.suraEnName
                            .toLowerCase()
                            .contains(searchText.toLowerCase());
                  }).toList();
                  setState(() {});
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: AppStyles.bold16Whtie,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: AppColors.primaryDark, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: AppColors.primaryDark, width: 2),
                  ),
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/icon_search.png"),
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              SizedBox(height: 20),
              searchText.isNotEmpty ? SizedBox() : builtMostRecently(),
              SizedBox(height: 10),
              Text(
                "Sura List",
                style: AppStyles.bold16Whtie,
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      thickness: 2,
                      indent: 30.5,
                      endIndent: 25.5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        saveLastSura(
                            suraEnName: filterList[index].suraEnName,
                            suraArName: filterList[index].suraArName,
                            numberOfVerses: filterList[index].numberOfVerses);
                        Navigator.of(context).pushNamed(
                            SuraDetalisScreen.routeName,
                            arguments: filterList[index]);
                      },
                      child: SuraListWidget(
                          index: index, suraModel: filterList[index]),
                    );
                  },
                  itemCount: filterList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget builtMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: AppStyles.bold16Whtie,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            if (lastSura.isNotEmpty &&
                lastSura["suraEnName"]!.isNotEmpty &&
                lastSura["suraArName"]!.isNotEmpty) {
              Navigator.of(context).pushNamed(
                SuraDetalisScreen.routeName,
                arguments: SuraModel(
                  suraEnName: lastSura["suraEnName"]!,
                  suraArName: lastSura["suraArName"]!,
                  numberOfVerses: lastSura["numberOfVerses"]!,
                  fileName:
                      "${SuraModel.suraArabicNameList.indexOf(lastSura["suraArName"]!) + 1}.txt",
                ),
              );
            } else {
              // يمكنك عرض رسالة إذا لم تكن هناك سورة محفوظة
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("No recently opened Sura available.")),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lastSura["suraEnName"] ?? "",
                          style: AppStyles.bold24black),
                      Text(lastSura["suraArName"] ?? "",
                          style: AppStyles.bold24black),
                      Text(
                        " ${lastSura["numberOfVerses"] ?? ""} Verses",
                        style: AppStyles.bold14black,
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/most_recently_image.png",
                    height: 80, // تحديد حجم الصورة
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numberOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("suraEnName", suraEnName);
    await prefs.setString("suraArName", suraArName);
    await prefs.setString("numberOfVerses", numberOfVerses);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString("suraEnName") ?? "";
    String suraArName = prefs.getString("suraArName") ?? "";
    String numberOfVerses = prefs.getString("numberOfVerses") ?? "";
    return {
      "suraEnName": suraEnName,
      "suraArName": suraArName,
      "numberOfVerses": numberOfVerses
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
