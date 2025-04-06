import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:din_guide_app/common_widgets/custom_button.dart';
import 'package:din_guide_app/constants/app_assets/assets_icons.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/constants/text_font_style.dart';
import 'package:din_guide_app/features/drawer/presentation/drawer.dart';
import 'package:din_guide_app/features/home/widgets/home_header.dart'
    show HomeHeader;
import 'package:din_guide_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../provider/carousel_provider.dart';
import '../widgets/my_features_widget.dart';
import '../widgets/prayers_time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);
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
                  image: AssetImage(AssetsImage.bg2),
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
                        const MyFeaturesWidgets(),
                        UIHelper.heightMedium,
                        Container(
                          height: 130,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AssetsIcons.ai, height: 70),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Ask Islamic consecp to AI bot.',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextFontStyle
                                                .textStyle18w600c333333,
                                      ),
                                      UIHelper.heightSmall,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: customButton(
                                          height: 30,
                                          color: AppColors.secondaryColor2,
                                          name: 'Open',
                                          onCallBack: () {},
                                          context: context,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(AssetsImage.askme, height: 65),
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
