import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/features/features/presentation/allah_name_screen.dart';
import 'package:din_guide_app/features/features/presentation/dua_screen.dart';
import 'package:din_guide_app/features/features/presentation/hajj_screen.dart';
import 'package:din_guide_app/features/features/presentation/kibla_screen.dart';
import 'package:din_guide_app/features/features/presentation/namaz_screen.dart';
import 'package:din_guide_app/features/features/presentation/qurbani_info_screen.dart';
import 'package:din_guide_app/features/features/presentation/roja_screen.dart';
import 'package:din_guide_app/features/quiz/presentation/quiz_category_screen.dart';
import 'package:din_guide_app/features/quran/presentation/quran_screen.dart';
import 'package:din_guide_app/features/salat/widgets/features_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'ফিচারসমূহ',
        leadingVisible: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FeatureCard(
              icon: LucideIcons.bookOpen,
              title: 'পবিত্র কুরআন',
              description: 'পূর্ণ কুরআন পাঠ করুন আরবি, অনুবাদ ও তাফসিরসহ।',
              color: Colors.purple.shade100,
              ontap: () {
                Get.to(() => QuranScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.bookOpen,
              title: 'ইসলামিক কুইজ',
              description: 'ইসলামিক কুইজে অংশগ্রহন করুন।',
              color: Colors.green.shade100,
              ontap: () {
                Get.to(() => CategoryScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.clock,
              title: 'ইসলামের পঞ্চস্তম্ভ',
              description: ' ইসলামের স্তম্ভ সম্পর্কে জানুন।',
              color: Colors.deepOrangeAccent.shade100,
              ontap: () {
                Get.to(() => const NamazLearningScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.clock,
              title: 'নামাজ',
              description: 'নামাজ সম্পর্কে জানুন বিস্তারিত..',
              color: Colors.blue.shade100,
              ontap: () {
                Get.to(() => const NamazLearningScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.footprints,
              title: 'হজ গাইড',
              description: 'হজের নিয়ম, দোয়া এবং প্রস্তুতির বিস্তারিত।',
              color: Colors.red.shade100,
              ontap: () {
                Get.to(() => const HajjScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.shieldCheck,
              title: 'ক্বুরবানি গাইড',
              description: 'ক্বুরবানির নিয়ম, শর্ত ও গুরুত্বপূর্ণ মাসায়েল।',
              color: Colors.lime.shade100,
              ontap: () {
                Get.to(() => const QurbaniInfoScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.sun,
              title: 'রোজা',
              description: 'রোজার নিয়ম, সাহরি-ইফতারের সময় ও দোয়া।',
              color: Colors.greenAccent.shade100,
              ontap: () {
                Get.to(() => const RojaDetailsScreen());
              },
            ),

            FeatureCard(
              icon: LucideIcons.moonStar,
              title: 'দোয়া',
              description: 'বিভিন্ন দোয়া ও তাদের বাংলা অনুবাদ পড়ুন।',
              color: Colors.pink.shade100,
              ontap: () {
                Get.to(() => const DuaScreen());
              },
            ),

            FeatureCard(
              icon: LucideIcons.star,
              title: 'আল্লাহর ৯৯ নাম',
              description: 'আস্মাউল হুসনা ও অর্থসহ মুখস্থ করুন।',
              color: Colors.cyan.shade100,
              ontap: () {
                Get.to(() => const AllahNameScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.star,
              title: 'তাসবিহ',
              description: 'তাসবিহ এর মাধ্যমে আমল করুন।',
              color: Colors.lightGreenAccent.shade100,
              ontap: () {
                Get.to(() => const AllahNameScreen());
              },
            ),

            FeatureCard(
              icon: LucideIcons.compass,
              title: 'কিবলা নির্দেশনা',
              description: 'আপনার অবস্থান থেকে কিবলার দিক নির্ণয় করুন।',
              color: Colors.orange.shade100,
              ontap: () {
                Get.to(() => const CompassScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
