import 'dart:math';
import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/features/quran/controller/quran_controller.dart';
import 'package:din_guide_app/features/quran/presentation/quran_detials.dart';
import 'package:din_guide_app/features/quran/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  final quranController = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'পবিত্র কুরআন', leadingVisible: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffdbeafe), Color(0xfff0fdf4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "সূরাসমূহ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (quranController.isLoading.value) {
                  return buildShimmerList();
                } else if (quranController.quranData.value.data?.surahs ==
                    null) {
                  return const Center(child: Text("কোনো সূরা পাওয়া যায়নি।"));
                } else {
                  final surahs = quranController.quranData.value.data!.surahs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: surahs!.length,
                    itemBuilder: (context, index) {
                      var surah = surahs[index];
                      Color randomColor = Color(
                        (Random().nextDouble() * 0xFFFFFF).toInt(),
                      ).withOpacity(0.2);

                      return GestureDetector(
                        onTap: () {
                          Get.to(() => SurahDetailScreen(surah: surah));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            title: Text(
                              surah.englishName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.indigo,
                              ),
                            ),
                            subtitle: Text(
                              surah.englishNameTranslation ?? '',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: randomColor,
                              child: Text(
                                "${surah.number}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black26,
                              size: 18,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
