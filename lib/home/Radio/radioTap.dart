import 'package:flutter/material.dart';
import 'package:islami/utils/App_assets.dart';
import 'package:islami/utils/appColors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami/model/Radio_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/home/Radio/cubit/radio_states.dart';
import 'package:islami/home/Radio/cubit/radio_view_model.dart';
class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => RadioViewModel()..loadRadioData(),
      child: Scaffold(

        backgroundColor: AppColors.blackColor,
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("Radio", 0, context),
                SizedBox(width: 10),
                _buildButton("Reciters", 1, context),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<RadioViewModel, RadioStates>(
                builder: (context, state) {
                  if (state is RadioLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is RadioErrorState) {
                    return Center(child: Text("Failed to load radio data"));
                  } else if (state is RadioSuccessState) {
                    return _buildRadioList(state.radioModel);
                  }
                  return SizedBox.shrink();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, int buttonIndex, BuildContext context) {
    return BlocBuilder<RadioViewModel, RadioStates>(
      builder: (context, state) {
        final viewModel = BlocProvider.of<RadioViewModel>(context);
        return ElevatedButton(
          onPressed: () {
            viewModel.selectButton(buttonIndex);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: viewModel.selectedButton == buttonIndex
                ? AppColors.primaryDark
                : AppColors.blackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: viewModel.selectedButton == buttonIndex
                  ? AppColors.blackColor
                  : AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }


  Widget _buildRadioList(RadioModel radioModel) {
    final audioPlayer = AudioPlayer();
    return ListView.builder(
      itemCount: radioModel.radios?.length ?? 0,
      itemBuilder: (context, index) {
        var radio = radioModel.radios![index];
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
                radio.name ?? "No Name",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    icon: Image.asset(AppAssets.playSoundIcon),
                    onPressed: () {
                      _playRadio(audioPlayer, radio.url ?? "");
                    },
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.volume_up, size: 28, color: AppColors.blackColor),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _playRadio(AudioPlayer audioPlayer, String url) async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.stop();
    } else {
      await audioPlayer.play(UrlSource(url));
    }
  }
}
