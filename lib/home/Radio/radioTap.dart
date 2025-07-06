import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/appColors.dart';
import 'package:islami/home/Radio/cubit/radio_states.dart';
import 'package:islami/home/Radio/cubit/radio_view_model.dart';
import 'package:islami/home/Radio/radio_list.dart'; // استورد الويجت

class RadioTab extends StatelessWidget {
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
                    return RadioList(radioModel: state.radioModel); // ✅ التعديل هنا
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
}

