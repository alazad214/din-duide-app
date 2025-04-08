import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:din_guide_app/constants/app_assets/assets_icons.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/features/drawer/presentation/drawer.dart';
import 'package:din_guide_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../provider/carousel_provider.dart';
import '../widgets/home_header.dart';
import '../widgets/my_features_widget.dart';
import '../widgets/prayers_time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.seeMoreFeatures, this.salatFeatures});
  final Function? seeMoreFeatures;
  final Function? salatFeatures;

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    log('build: HomeScreen is being built');
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
                  buildCarouselSlider(context, carouselProvider),
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
                            'Prayer’s Time',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const PrayersTime(),
                        const Text(
                          'Our Features',
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
                        UIHelper.heightMedium,
                        Container(
                          height: 150,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor2,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withAlpha(
                                  (0.3 * 255).toInt(),
                                ),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsIcons.ai,
                                height: 60,
                                width: 60,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Explore Islamic guidance with smart AI',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        backgroundColor: Colors.white,
                                        foregroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 2,
                                      ),
                                      child: const Text(
                                        'Open',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                AssetsImage.askme,
                                height: 65,
                                width: 65,
                              ),
                            ],
                          ),
                        ),
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

  Widget buildCarouselSlider(
    BuildContext context,
    CarouselProvider carouselProvider,
  ) {
    return Consumer<CarouselProvider>(
      builder: (context, carouselProvider, child) {
        return CarouselSlider.builder(
          itemCount: carouselProvider.carouselList.length,
          itemBuilder:
              (BuildContext context, int index, int pageViewIndex) => Container(
                height: 160,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  carouselProvider.carouselList[index],
                  fit: BoxFit.cover,
                ),
              ),
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 1),
            viewportFraction: 1,
            autoPlay: false,
            height: 160.h,
            onPageChanged: (index, reason) {
              carouselProvider.setCurrentIndex(index);
            },
          ),
        );
      },
    );
  }
}
