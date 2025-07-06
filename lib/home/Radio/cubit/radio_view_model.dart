import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islami/home/Radio/cubit/radio_states.dart';
import 'package:islami/core/api/Api_manager.dart';
import 'package:islami/model/Radio_model.dart';

class RadioViewModel extends Cubit<RadioStates> {
  RadioViewModel() : super(RadioLoadingState());

  int selectedButton = 0;

  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> loadRadioData() async {
    emit(RadioLoadingState());
    try {
      RadioModel? radioModel = await ApiManager.getRadio();
      if (radioModel != null) {
        emit(RadioSuccessState(radioModel: radioModel));
      } else {
        emit(RadioErrorState());
      }
    } catch (e) {
      emit(RadioErrorState());
    }
  }

  void playRadio(String url) async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.stop();
    }
    await audioPlayer.play(UrlSource(url));
  }

  void selectButton(int buttonIndex) {
    selectedButton = buttonIndex;
    emit(RadioButtonSelectedState(selectedButton));
  }
}
