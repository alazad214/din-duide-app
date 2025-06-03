import 'dart:developer';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/features/drawer/presentation/drawer.dart';
import 'package:din_guide_app/features/home/widgets/build_carousel_slider.dart';
import 'package:din_guide_app/core/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../../core/common/utils/assets_image.dart';
import '../widgets/build_ai_card.dart';
import '../widgets/home_header.dart';
import '../widgets/my_features_widget.dart';
import '../widgets/prayers_time.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, this.seeMoreFeatures, this.salatFeatures});
  final Function? seeMoreFeatures;
  final Function? salatFeatures;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    log('build');
    return Scaffold(
      key: scaffoldKey,

      drawer: const CustomDrawer(),
      backgroundColor: AppColors.cWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 3.5,
              width: Get.width / 1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg3),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: HomeHeader(
                      drawerOntap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCarouselSlider(context, _pageController),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        const SizedBox(
                          width: 364,
                          child: Text(
                            'নামাজের সময়সূচি',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const PrayersTime(),
                        const Text(
                          'ফিচারসমূহ',
                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        MyFeaturesWidgets(
                          moreFeatures: seeMoreFeatures ?? () {},
                          salatFeatures: salatFeatures ?? () {},
                        ),
                        UIHelper.verticalSpaceMedium,
                        buildAIAssistant(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
