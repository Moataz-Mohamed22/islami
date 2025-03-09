import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/hadetModel.dart';
import '../../utils/appColors.dart';
import 'cubit/hadeth_state.dart';
import 'cubit/hadeth_view_model.dart';
import 'hadethDetalis.dart';


class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HadethCubit(),
      child: Scaffold(
        body: Column(
          children: [
            _buildHeaderImage(),
            Expanded(child: _buildHadethContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Image.asset('assets/images/Logo_quran.png');
  }

  Widget _buildHadethContent() {
    return BlocBuilder<HadethCubit, HadethState>(
      builder: (context, state) {
        if (state is HadethLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryDark),
          );
        } else if (state is HadethLoaded) {
          return _buildCarousel(state.hadethList);
        } else if (state is HadethError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCarousel(List<HadethModel> hadethList) {
    return CarouselSlider.builder(
      itemCount: hadethList.length,
      options: CarouselOptions(
       height: MediaQuery.of(context).size.height * 0.63,
        viewportFraction: 0.75,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, _) => _buildCarouselItem(context, hadethList[index]),
    );
  }

  Widget _buildCarouselItem(BuildContext context, HadethModel hadeth) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        HadethDetails.routeName,
        arguments: hadeth,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryDark,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/HadethBg.png'),
          ),
        ),
        child: Column(
          children: [
            Text(
              hadeth.titel,
              style: const TextStyle(color: AppColors.blackColor, fontSize: 24),
            ),
            Expanded(
              child: Text(
                hadeth.Content.join(''),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
