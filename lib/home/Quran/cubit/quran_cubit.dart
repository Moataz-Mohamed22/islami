import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/home/Quran/cubit/quran_states.dart';
import '../../../model/SuraModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);

  List<SuraModel> suraList = [];
  List<SuraModel> filteredList = [];
  Map<String, String> lastSura = {};
  String searchText = "";

  void init() {
    addSuraList();
    loadLastSura();
  }

  void addSuraList() {
    suraList = List.generate(114, (i) {
      return SuraModel(
        suraArName: SuraModel.suraArabicNameList[i],
        suraEnName: SuraModel.surEnglishNameList[i],
        numberOfVerses: SuraModel.numberOfVersesList[i],
        fileName: "${i + 1}.txt",
      );
    });

    filteredList = List.from(suraList);
    emit(SuraListLoaded());
  }

  void filter(String text) {
    searchText = text;
    filteredList = suraList.where((sura) {
      return sura.suraArName.contains(text) ||
          sura.suraEnName.toLowerCase().contains(text.toLowerCase());
    }).toList();
    emit(SuraListFiltered());
  }

  Future<void> saveLastSura({
    required String suraEnName,
    required String suraArName,
    required String numberOfVerses,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("suraEnName", suraEnName);
    await prefs.setString("suraArName", suraArName);
    await prefs.setString("numberOfVerses", numberOfVerses);
    await loadLastSura();
  }

  Future<void> loadLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lastSura = {
      "suraEnName": prefs.getString("suraEnName") ?? "",
      "suraArName": prefs.getString("suraArName") ?? "",
      "numberOfVerses": prefs.getString("numberOfVerses") ?? "",
    };
    emit(LastSuraLoaded());
  }
}
