import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/features/home/provider/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildCarouselSlider(
  BuildContext context,
  CarouselProvider carouselProvider,
  pageController,
) {
  return Consumer<CarouselProvider>(
    builder: (context, carouselProvider, child) {
      return Column(
        children: [
          SizedBox(
            height: 160.h,
            child: PageView.builder(
              controller: pageController,
              itemCount: carouselProvider.carouselList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 160,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    carouselProvider.carouselList[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              onPageChanged: (index) {
                carouselProvider.setCurrentIndex(index);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SmoothPageIndicator(
              controller: pageController,
              count: carouselProvider.carouselList.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 8.0,
                dotHeight: 5.0,
                spacing: 5.0,
                expansionFactor: 2.0,
                dotColor: Colors.black12,
                activeDotColor: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}
