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
        title: '$categoryTitle ক্যাটাগরি',
        leadingVisible: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('নির্দেশাবলি', style: TextFontStyle.textStyle24w500c767676),
            const SizedBox(height: 16),
            instructionPoint('প্রতিটি প্রশ্ন মনোযোগ দিয়ে পড়ুন।'),
            instructionPoint(
              'প্রতিটি প্রশ্নের জন্য কেবল একটি অপশন নির্বাচন করুন।',
            ),
            instructionPoint(
              'একবার অপশন বেছে নেওয়ার পর তা পরিবর্তন করা যাবে না।',
            ),
            instructionPoint('আপনি পূর্বের প্রশ্নগুলোতে ফিরে যেতে পারবেন।'),
            instructionPoint('সকল প্রশ্নের উত্তর দেওয়ার চেষ্টা করুন।'),
            instructionPoint('কুইজ সম্পন্ন করার জন্য কোনো সময়সীমা নেই।'),
            instructionPoint('আপনি যেকোনো সময় কুইজ থেকে বের হতে পারেন।'),
            instructionPoint(
              'আপনি যদি ৫০% এর কম প্রশ্নের উত্তর দেন, তবে ফলাফল প্রদর্শন করা হবে না।',
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(20.sp),
        child: customButton(
          name: 'শুরু করুন',
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
