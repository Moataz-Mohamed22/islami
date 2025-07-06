import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/App_assets.dart';
import '../../core/utils/appColors.dart';
import '../../model/Radio_model.dart';
import 'cubit/radio_view_model.dart';

class RadioList extends StatelessWidget {
  final RadioModel radioModel;

  const RadioList({super.key, required this.radioModel});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<RadioViewModel>(context);

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
                      viewModel.playRadio(radio.url ?? "");
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
}
