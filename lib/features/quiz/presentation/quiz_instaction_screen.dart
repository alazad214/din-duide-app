import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/core/common/widgets/custom_button.dart';
import 'package:din_guide_app/core/common/styles/text_font_style.dart';
import 'package:din_guide_app/features/quiz/presentation/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuizInstructionScreen extends StatelessWidget {
  final String categoryTitle;

  const QuizInstructionScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: '$categoryTitle Category',
        leadingVisible: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Instructions', style: TextFontStyle.textStyle24w500c767676),
            const SizedBox(height: 16),
            instructionPoint('Read each question carefully.'),
            instructionPoint('Select only one option per question.'),
            instructionPoint('Once selected, the option cannot be changed.'),
            instructionPoint('You can go back to previous questions.'),
            instructionPoint('Try to answer all the questions.'),
            instructionPoint('No time limit to complete the quiz.'),
            instructionPoint('You can exit the quiz at any time.'),
            instructionPoint(
              'If you answer less than 50% of the questions, the result screen will not be shown.',
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(20.sp),
        child: customButton(
          name: 'Start Quiz',
          onCallBack: () {
            Get.to(() => QuizScreen(category: categoryTitle));
          },
          context: context,
        ),
      ),
    );
  }

  Widget instructionPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.teal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: TextFontStyle.textStyle16w400c76767),
          ),
        ],
      ),
    );
  }
}
