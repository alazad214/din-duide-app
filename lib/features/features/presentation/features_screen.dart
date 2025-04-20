import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/features/features/presentation/allah_name_screen.dart';
import 'package:din_guide_app/features/features/presentation/dua_screen.dart';
import 'package:din_guide_app/features/features/presentation/hajj_screen.dart';
import 'package:din_guide_app/features/features/presentation/juma_day.dart';
import 'package:din_guide_app/features/features/presentation/kibla_screen.dart';
import 'package:din_guide_app/features/features/presentation/namaz_screen.dart';
import 'package:din_guide_app/features/features/presentation/qurbani_info_screen.dart';
import 'package:din_guide_app/features/features/presentation/roja_screen.dart';
import 'package:din_guide_app/features/quran/presentation/quran_screen.dart';
import 'package:din_guide_app/features/salat/widgets/features_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:toastification/toastification.dart';

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
              color: Colors.green.shade100,
              ontap: () {
                  Get.to(() =>  QuranScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.clock,
              title: 'নামাজ শিখা',
              description: 'লোকেশন অনুযায়ী নামাজের সময় জেনে নিন।',
              color: Colors.blue.shade100,
              ontap: () {
                Get.to(() => const NamazLearningScreen());
              },
            ),
            FeatureCard(
              icon: LucideIcons.bell,
              title: 'আযান অ্যালার্ম',
              description: 'নামাজের জন্য অটোমেটিক আযান অ্যালার্ম সেট করুন।',
              color: Colors.purple.shade100,
              ontap: () {
                toastification.show(
                  title: const Text('Comming soon..'),
                  type: ToastificationType.warning,
                );
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
              icon: LucideIcons.footprints,
              title: 'হজ গাইড',
              description: 'হজের নিয়ম, দোয়া এবং প্রস্তুতির বিস্তারিত।',
              color: Colors.red.shade100,
              ontap: () {
                Get.to(() => const HajjScreen());
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
              icon: LucideIcons.book,
              title: 'নামাজ শিক্ষা',
              description: 'নামাজের নিয়ম, দোয়া এবং সূরা শিখুন।',
              color: Colors.indigo.shade100,
              ontap: () {
                toastification.show(
                  title: const Text('Comming soon..'),
                  type: ToastificationType.warning,
                );
              },
            ),

            FeatureCard(
              icon: LucideIcons.user,
              title: 'ইসলামিক নাম',
              description: 'ছেলে ও মেয়েদের সুন্দর ইসলামিক নাম খুঁজুন।',
              color: Colors.deepPurple.shade100,
              ontap: () {
                toastification.show(
                  title: const Text('Comming soon..'),
                  type: ToastificationType.warning,
                );
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
              icon: LucideIcons.calendar,
              title: 'হিজরি ক্যালেন্ডার',
              description: 'হিজরি ও ইংরেজি তারিখ একসাথে দেখুন।',
              color: Colors.brown.shade100,
              ontap: () {
                toastification.show(
                  title: const Text('Comming soon..'),
                  type: ToastificationType.warning,
                );
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
              icon: LucideIcons.sunrise,
              title: 'জুমার ফজিলত',
              description: 'জুমার গুরুত্ব, সূরা কাহফ ও দোয়ার সংকলন।',
              color: Colors.teal.shade100,
              ontap: () {
                Get.to(() => const JummahInfoScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
