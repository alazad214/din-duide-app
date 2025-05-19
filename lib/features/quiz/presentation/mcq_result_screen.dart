import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/common_widgets/custom_button.dart';
import 'package:din_guide_app/constants/text_font_style.dart';
import 'package:din_guide_app/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quizData;
  final List<int?> selectedAnswers;

  const ResultScreen({
    super.key,
    required this.quizData,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Quiz Result', leadingVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: quizData.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final question = quizData[index];
                final userAnswer = selectedAnswers[index];
                final correctAnswer = question["answerIndex"];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${index + 1}: ${question["question"]}',
                      style: TextFontStyle.textStyle14w500c242424,
                    ),
                    const SizedBox(height: 8),

                    ...List.generate(question["options"].length, (i) {
                      final isCorrect = i == correctAnswer;
                      final isSelected = i == userAnswer;

                      Color bgColor = Colors.white;
                      Color textColor = Colors.black87;
                      BorderSide border = const BorderSide(
                        color: Colors.black12,
                      );

                      if (isCorrect) {
                        bgColor = Colors.green.shade100;
                        textColor = Colors.green.shade800;
                        border = const BorderSide(color: Colors.green);
                      } else if (isSelected && !isCorrect) {
                        bgColor = Colors.red.shade100;
                        textColor = Colors.red.shade800;
                        border = const BorderSide(color: Colors.red);
                      }

                      final optionLabel = String.fromCharCode(65 + i);

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          border: Border.all(width: 1.2, color: border.color),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal.withAlpha(
                                  (0.1 * 255).toInt(),
                                ),
                                border: Border.all(color: Colors.teal),
                              ),
                              child: Text(
                                optionLabel,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                question["options"][i],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const Divider(height: 30),
                  ],
                );
              },
            ),

            SizedBox(height: 100.h),
          ],
        ),
      ),

      bottomSheet: Padding(
        padding: EdgeInsets.all(20.sp),
        child: customButton(
          name: 'Go to home',
          onCallBack: () {
            Get.offAll(() => const NavigationScreen());
          },
          context: context,
        ),
      ),
    );
  }
}
