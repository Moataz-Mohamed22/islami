import 'package:flutter/material.dart';

import '../../model/hadetModel.dart';
import '../../utils/appColors.dart';


class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadethDetails';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final hadeth = ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildBackground(),
          _buildContent(hadeth),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      color: AppColors.blackBGColor,
      child: Image.asset(
        'assets/images/detalis_Bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildContent(HadethModel hadeth) {
    return Column(
      children: [
        const SizedBox(height: 17),
        _buildTitle(hadeth.titel),
        _buildContentList(hadeth.Content),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryDark,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildContentList(List<String> content) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            content[index],
            style: const TextStyle(color: AppColors.primaryDark, fontSize: 18),
          ),
        ),
        itemCount: content.length,
      ),
    );
  }
}
