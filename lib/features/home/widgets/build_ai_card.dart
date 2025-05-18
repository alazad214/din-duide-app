import 'package:din_guide_app/features/assistant/presentation/ai_assistant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_colors.dart';

Container buildAIAssistant(BuildContext context) {
  return Container(
    height: 150,
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.primaryColor, AppColors.secondaryColor2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha((0.3 * 255).toInt()),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Discover Islam with Din Guide AI Assistant',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              customButton(
                name: 'Start',
                minWidth: Get.width / 2.5,
                height: 40,
                onCallBack: () {
                  Get.to(const ChatScreen());
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
