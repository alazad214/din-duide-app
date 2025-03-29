import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:din_guide_app/features/home/widgets/home_header.dart' show HomeHeader;
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
    log('build');
    return Scaffold(
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
                borderRadius:const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),

              child: const SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(child: HomeHeader()),
                ),
              ),
            ),

            Padding(
              padding:const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCarouselSlider(context, carouselProvider),
                 const SizedBox(height: 20),
                 const SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        SizedBox(
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
                        PrayersTime(),
                        Text(
                          'Our Features',
                          style: TextStyle(
                            color:  Color(0xFF222222),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        MyFeaturesWidgets(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const  SizedBox(height: 50),
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
            autoPlayInterval:const Duration(seconds: 1),
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
