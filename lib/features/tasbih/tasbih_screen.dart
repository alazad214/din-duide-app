import 'dart:developer';
import 'package:din_guide_app/features/tasbih/tasbih_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../common_widgets/custom_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_font_style.dart';
import '../../helpers/navigation_service.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('build');
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
                        icon: const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),
                      const Text(
                        'Tasbih Count',
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

            Consumer<TasbihProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      "AR-RAHMAAN",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      "The Most or Entirely Merciful",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                   const Divider(),
                  const  SizedBox(height: 20),
                   const Text(
                      "Tasbih Counter",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Text(
                      provider.number.toString(),
                      style:const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(AssetsImage.tasbih, height: 250),
                    ),
                   const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: customButton(
                              name: 'Reset',
                              height: 50,
                              borderColor: AppColors.primaryColor,
                              color: Colors.transparent,
                              textStyle: TextFontStyle.textStyle16w600cFFFFFF
                                  .copyWith(color: AppColors.primaryColor),
                              onCallBack: () {
                                provider.resetTasbih();
                              },
                              context: context,
                            ),
                          ),
                         const SizedBox(width: 50),
                          Expanded(
                            child: customButton(
                              name: 'Add',
                              height: 50,
                              onCallBack: () {
                                provider.countTasbih();
                              },
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
