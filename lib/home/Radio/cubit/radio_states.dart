import 'package:islami/model/Radio_model.dart';

class RadioStates {}

class RadioLoadingState extends RadioStates {}

class RadioErrorState extends RadioStates {}

class RadioSuccessState extends RadioStates {
  final RadioModel radioModel;
  RadioSuccessState({required this.radioModel});
}

class RadioButtonSelectedState extends RadioStates {
  final int selectedButton;
  RadioButtonSelectedState(this.selectedButton);
}