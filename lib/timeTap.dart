import 'package:flutter/material.dart';
import 'package:islami/utils/App_assets.dart';

class TimeTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.backgroundTimeTab),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Image.asset(AppAssets.backgroundOnboard1)
          ],)
        ],
      ),
    );
  }
}