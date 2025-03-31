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
        spacing: 18,
        runSpacing: 16,
        children: [
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
          buildFeaturesItem('Quran', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
          buildFeaturesItem('Hatish', AssetsIcons.jakat, () {
            Get.to(() => const JakatScreen());
          }),
          buildFeaturesItem('Namaz', AssetsIcons.jakat, () {
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
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F2EF),
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
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
