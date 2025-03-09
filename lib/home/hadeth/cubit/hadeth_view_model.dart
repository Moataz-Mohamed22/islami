import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../model/hadetModel.dart';
import 'hadeth_state.dart';

class HadethCubit extends Cubit<HadethState> {
  HadethCubit() : super(HadethInitial()) {
    loadHadethFiles();
  }

  Future<void> loadHadethFiles() async {
    emit(HadethLoading());
    try {
      List<HadethModel> hadethList = [];
      for (int i = 1; i <= 50; i++) {
        final content = await rootBundle.loadString('assets/files/Hadeeth/h$i.txt');
        final lines = content.split('\n');
        final title = lines[0];
        lines.removeAt(0);
        hadethList.add(HadethModel(titel: title, Content: lines));
      }
      emit(HadethLoaded(hadethList));
    } catch (e) {
      emit(HadethError('فشل تحميل الأحاديث: $e'));
    }
  }
}