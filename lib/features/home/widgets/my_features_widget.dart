import 'package:din_guide_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../dua/presentation/dua_playlist_screen.dart';
import '../../tasbih/tasbih_screen.dart';
import '../presentation/allah_name_screen.dart';
import '../presentation/jakat_screen.dart';

class MyFeaturesWidgets extends StatelessWidget {
  const MyFeaturesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 15,
        runSpacing: 15,
        children: [
          buildFeaturesItem('Quran', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
          buildFeaturesItem('Namaz', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
          buildFeaturesItem('Roja', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
          buildFeaturesItem('Haj', AssetsIcons.dua, () {
            Get.to(() => const DuaPlaylistScreen());
          }),
          buildFeaturesItem('Dua', AssetsIcons.dua, () {
            Get.to(() => const DuaPlaylistScreen());
          }),
          buildFeaturesItem('Name', AssetsIcons.name, () {
            Get.to(() => const AllahNameScreen());
          }),
          buildFeaturesItem('Tasbi', AssetsIcons.tasbi, () {
            Get.to(() => const TasbihScreen());
          }),
          buildFeaturesItem('Jakat', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),

          buildFeaturesItem('More', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
        ],
      ),
    );
  }

  GestureDetector buildFeaturesItem(title, image, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: Get.width / 4,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.cE8E8E8,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(image),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.c818181,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
