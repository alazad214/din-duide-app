import 'package:din_guide_app/features/assistant/presentation/ai_assistant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/custom_button.dart';
import '../../../core/common/utils/assets_icons.dart';
import '../../../core/common/styles/app_colors.dart';

Container buildAIAssistant(BuildContext context) {
  return Container(
    height: 150,
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.primaryColor, AppColors.primaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'দিন গাইড এআই সহকারী দিয়ে ইসলামকে জানুন।',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              customButton(
                name: 'শুরু করুন',
                minWidth: Get.width / 2.5,
                height: 40,
                color: AppColors.c187488,

                onCallBack: () {
                  Get.to(const AiAssistantScreen());
                },
                context: context,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(AssetsIcons.ai, height: 70),
      ],
    ),
  );
}
