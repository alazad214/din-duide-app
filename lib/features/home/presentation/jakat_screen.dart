import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/navigation_service.dart';
import '../widgets/allah_mane_list.dart';

class JakatScreen extends StatelessWidget {
  const JakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 8,
              width: Get.width / 1,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          NavigationService.goBack;
                        },
                        icon:const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),

                      const Text(
                        'Why Need Jakat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const  Padding(
              padding:const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The characteristics of Zakat",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 20),
                  Text(
                    jakatText,
                    style: TextStyle(
                      color: AppColors.c333333,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
