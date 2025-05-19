import 'dart:core';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/features/quran/presentation/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../assistant/presentation/ai_assistant_screen.dart';
import '../../features/presentation/dua_screen.dart';
import '../../features/presentation/roja_screen.dart';
import '../../tasbih/tasbih_screen.dart';
import '../../features/presentation/hajj_screen.dart';
import '../../features/presentation/allah_name_screen.dart';

class MyFeaturesWidgets extends StatelessWidget {
  final Function moreFeatures;
  final Function salatFeatures;
  const MyFeaturesWidgets({
    super.key,
    required this.moreFeatures,
    required this.salatFeatures,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 10,
        children: [
          buildFeaturesItem('অ্যাসিস্ট্যান্ট', LucideIcons.bot, () {
            Get.to(const ChatScreen());
          }, Colors.green.shade100),
          buildFeaturesItem('কুরআন', LucideIcons.bookOpen, () {
            Get.to(() => QuranScreen());
          }, Colors.green.shade100),

          buildFeaturesItem(
            'নামাজ',
            LucideIcons.clock,
            salatFeatures as VoidCallback,
            Colors.blue.shade100,
          ),

          buildFeaturesItem('রোজা', LucideIcons.sun, () {
            Get.to(() => const RojaDetailsScreen());
          }, Colors.orange.shade100),

          buildFeaturesItem('হজ গাইড', LucideIcons.mapPin, () {
            Get.to(() => const HajjScreen());
          }, Colors.red.shade100),

          buildFeaturesItem('দোয়া', LucideIcons.hand, () {
            Get.to(() => const DuaScreen());
          }, Colors.purple.shade100),

          buildFeaturesItem('আল্লাহর নাম', LucideIcons.star, () {
            Get.to(() => const AllahNameScreen());
          }, Colors.teal.shade100),

          buildFeaturesItem('তাসবিহ', LucideIcons.circleDot, () {
            Get.to(() => const TasbihScreen());
          }, Colors.amber.shade100),

          buildFeaturesItem(
            'আরও',
            LucideIcons.menu,
            moreFeatures as VoidCallback,
            Colors.grey.shade300,
          ),
        ],
      ),
    );
  }

  Widget buildFeaturesItem(
    String title,
    IconData icon,
    VoidCallback ontap,
    Color bgColor,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 100,
        width: Get.width / 3.8,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.3 * 255).toInt()),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34, color: AppColors.c333333),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.c2C2126,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
