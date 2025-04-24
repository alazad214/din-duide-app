import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  List<int?> selectedAnswers = [];

  final List<Map<String, dynamic>> quizData = [
    {
      "question": "কুরআন শরীফে কতটি সূরা আছে?",
      "options": ["112", "113", "114", "115"],
      "answerIndex": 2,
    },
    {
      "question": "রাসূল (সা.) কোথায় জন্মগ্রহণ করেন?",
      "options": ["মদিনা", "মক্কা", "তায়েফ", "সিরিয়া"],
      "answerIndex": 1,
    },
    {
      "question": "ইসলামের কতটি স্তম্ভ?",
      "options": ["৩", "৪", "৫", "৬"],
      "answerIndex": 2,
    },
  ];

  @override
  void initState() {
    super.initState();
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
    int score = 0;
    for (int i = 0; i < quizData.length; i++) {
      if (selectedAnswers[i] == quizData[i]["answerIndex"]) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Result"),
        content: Text("আপনার স্কোর: $score / ${quizData.length}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("ঠিক আছে"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiz = quizData[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Islamic Quiz"),
        backgroundColor: const Color(0xFF2D6A4F),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "প্রশ্ন ${currentIndex + 1}/${quizData.length}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              currentQuiz["question"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(currentQuiz["options"].length, (i) {
              return RadioListTile<int>(
                title: Text(currentQuiz["options"][i]),
                value: i,
                groupValue: selectedAnswers[currentIndex],
                onChanged: (val) {
                  setState(() => selectedAnswers[currentIndex] = val);
                },
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: prevQuestion,
                  child: const Text("Previous"),
                ),
                currentIndex == quizData.length - 1
                    ? ElevatedButton(
                        onPressed: submitQuiz,
                        child: const Text("Submit"),
                      )
                    : ElevatedButton(
                        onPressed: nextQuestion,
                        child: const Text("Next"),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
