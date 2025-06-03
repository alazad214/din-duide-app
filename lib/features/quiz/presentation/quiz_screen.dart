import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/core/common/widgets/common_popup.dart';
import 'package:din_guide_app/core/common/widgets/custom_button.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/core/common/styles/text_font_style.dart';
import 'package:din_guide_app/features/quiz/presentation/mcq_result_screen.dart';
import 'package:din_guide_app/features/quiz/widgets/mcq_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  List<int?> selectedAnswers = [];
  late List<Map<String, dynamic>> quizData;

  @override
  void initState() {
    super.initState();

    quizData =
        allQuizData.where((q) => q['category'] == widget.category).toList();

    selectedAnswers = List.filled(quizData.length, null);
  }

  void nextQuestion() {
    if (currentIndex < quizData.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  void submitQuiz() {
    int answeredCount =
        selectedAnswers.where((answer) => answer != null).length;

    if (answeredCount < (quizData.length / 2).ceil()) {
      CommonPopup.popup(
        context,
        title: 'দুঃখীত!',
        subtitle: 'কমপক্ষে ৫০% প্রশ্নের উত্তর দিন।',
      );

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => ResultScreen(
              quizData: quizData,
              selectedAnswers: selectedAnswers,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quizData.isEmpty) {
      return Scaffold(
        appBar: CustomAppbar(
          title: '${widget.category} Category',
          leadingVisible: true,
        ),
        body: Center(
          child: Text(
            'No questions available for "${widget.category}".',
            style: TextFontStyle.textStyle12w600c000000,
          ),
        ),
      );
    }

    final currentQuiz = quizData[currentIndex];

    return Scaffold(
      appBar: CustomAppbar(
        title: '${widget.category} Category',
        leadingVisible: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Q: ',
                    style: TextFontStyle.textStyle16w700c333333,
                  ),
                  TextSpan(
                    text: '${currentIndex + 1} /',
                    style: TextFontStyle.textStyle18w700c333333,
                  ),
                  TextSpan(
                    text: ' ${quizData.length}',
                    style: TextFontStyle.textStyle14w400c333333,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            //Question--->>
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(
                'Question: ${currentQuiz["question"]}',
                style: TextFontStyle.textStyle13w400c818181,
              ),
            ),
            const SizedBox(height: 20),

            //Option Section-->>
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentQuiz["options"].length,
              itemBuilder: (context, i) {
                final isSelected = selectedAnswers[currentIndex] == i;
                final optionLabel = String.fromCharCode(65 + i);

                return GestureDetector(
                  onTap:
                      selectedAnswers[currentIndex] == null
                          ? () {
                            setState(() => selectedAnswers[currentIndex] = i);
                          }
                          : null,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isSelected ? Colors.white : Colors.teal.shade50,
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: Text(
                            optionLabel,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  isSelected
                                      ? AppColors.primaryColor
                                      : Colors.teal[800],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            currentQuiz["options"][i],
                            style: TextFontStyle.textStyle14w500c242424
                                .copyWith(
                                  color:
                                      isSelected
                                          ? AppColors.cWhite
                                          : AppColors.c333333,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.sp),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentIndex > 0)
              Expanded(
                child: customButton(
                  name: 'Previous',
                  onCallBack: prevQuestion,
                  context: context,
                ),
              ),

            SizedBox(width: 10.w),

            currentIndex == quizData.length - 1
                ? Expanded(
                  child: customButton(
                    name: 'Submit',
                    onCallBack: submitQuiz,
                    context: context,
                  ),
                )
                : Expanded(
                  child: customButton(
                    name: 'Next',
                    onCallBack: nextQuestion,
                    context: context,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
