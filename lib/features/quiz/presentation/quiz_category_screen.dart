import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/core/common/styles/text_font_style.dart';
import 'package:din_guide_app/features/quiz/presentation/quiz_instaction_screen.dart';
import 'package:din_guide_app/features/quiz/widgets/category_utils.dart';
import 'package:din_guide_app/features/quiz/widgets/quiz_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'ক্যাটাগরি নির্বাচন', leadingVisible: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ক্যাটাগরি বেছে নিন',
                style: TextFontStyle.textStyle24w500c767676,
              ),
              const SizedBox(height: 10),
              Text(
                'ক্যাটাগরিগুলো অন্বেষণ করুন এবং ইসলামের সম্পর্কে আপনার জ্ঞান পরীক্ষা করুন।',
                style: TextFontStyle.textStyle16w500cFF6B6B.copyWith(
                  color: AppColors.c818181,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => const QuizInstructionScreen(
                              categoryTitle: 'Quran',
                            ),
                          );
                        },
                        child: categoryCard(
                          context,
                          title: categories[i]['title'],
                          image: categories[i]['icon'],
                          index: i,
                          ontap: () {
                            Get.to(
                              () => QuizInstructionScreen(
                                categoryTitle: categories[i]['title'],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
