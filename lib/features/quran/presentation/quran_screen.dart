import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/features/quran/controller/surah_api_controller.dart';
import 'package:din_guide_app/features/quran/presentation/quran_detials.dart';
import 'package:din_guide_app/features/quran/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  final controller = Get.put(SurahApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cWhite,
      appBar: const CustomAppbar(title: 'পবিত্র কুরআন', leadingVisible: true),
      body: Obx(() {
        return controller.isLoading.value
            ? buildShimmerList()
            : controller.quranData.value.surahList == null
            ? const Center(child: Text("কোনো সূরা পাওয়া যায়নি।"))
            : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: controller.quranData.value.surahList?.length ?? 0,
              itemBuilder: (context, index) {
                final surah = controller.quranData.value.surahList?[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () =>
                          SurahDetailScreen(surahName: surah!.name.toString()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12, width: 0.5),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.primaryColor,
                          child: Text(
                            "${surah?.number}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                surah?.bangla ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                surah?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
      }),
    );
  }
}
