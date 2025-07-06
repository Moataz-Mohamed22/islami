import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/home/Quran/SuraDetalisScreen.dart';
import 'package:islami/home/Quran/sura_List_Widget.dart';
import 'package:islami/model/SuraModel.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/app_styles.dart';
import 'cubit/quran_cubit.dart';
import 'cubit/quran_states.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..init(),
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          var cubit = QuranCubit.get(context);

          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/Logo_quran.png"),
                    TextField(
                      style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                      onChanged: (text) => cubit.filter(text),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Sura Name",
                        hintStyle: AppStyles.bold16White,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
                        ),
                        prefixIcon: ImageIcon(
                          AssetImage("assets/images/icon_search.png"),
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    cubit.searchText.isNotEmpty ? SizedBox() : buildMostRecently(cubit, context),
                    const SizedBox(height: 10),
                    Text("Sura List", style: AppStyles.bold16White),
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: cubit.filteredList.length,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 30.5,
                          endIndent: 25.5,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              var sura = cubit.filteredList[index];
                              cubit.saveLastSura(
                                suraEnName: sura.suraEnName,
                                suraArName: sura.suraArName,
                                numberOfVerses: sura.numberOfVerses,
                              );
                              Navigator.of(context).pushNamed(
                                SuraDetalisScreen.routeName,
                                arguments: sura,
                              );
                            },
                            child: SuraListWidget(
                              index: index,
                              suraModel: cubit.filteredList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMostRecently(QuranCubit cubit, BuildContext context) {
    var lastSura = cubit.lastSura;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: AppStyles.bold16White),
        const SizedBox(height: 10),
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No recently opened Sura available.")),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lastSura["suraEnName"] ?? "", style: AppStyles.bold24black),
                    Text(lastSura["suraArName"] ?? "", style: AppStyles.bold24black),
                    Text(
                      "${lastSura["numberOfVerses"] ?? ""} Verses",
                      style: AppStyles.bold14black,
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/most_recently_image.png",
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

