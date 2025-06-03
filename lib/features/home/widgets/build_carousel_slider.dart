import 'package:din_guide_app/core/common/utils/networks_image.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/carousel_provider.dart';

Widget buildCarouselSlider(
  BuildContext context,
  PageController pageController,
) {
  final List<String> carouselImages = [
    NetworksImage.sliderImage,
    NetworksImage.sliderImage2,
    NetworksImage.sliderImage3,
  ];

  return Consumer(
    builder: (context, ref, _) {
      final currentIndex = ref.watch(carouselIndexProvider);

      return Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: pageController,
              itemCount: carouselImages.length,
              onPageChanged: (index) {
                ref.read(carouselIndexProvider.notifier).state = index;
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    carouselImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(carouselImages.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index
                          ? AppColors.primaryColor
                          : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
        ],
      );
    },
  );
}
