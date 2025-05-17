import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:flutter/material.dart';

class IslamicQuizCategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Quran', 'icon': Icons.menu_book},
    {'title': 'Hadith', 'icon': Icons.library_books},
    {'title': 'Seerah', 'icon': Icons.person},
    {'title': 'Fiqh', 'icon': Icons.rule},
    {'title': 'History', 'icon': Icons.history_edu},
    {'title': 'Dua', 'icon': Icons.favorite},
  ];

  IslamicQuizCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F4),
      appBar: const CustomAppbar(title: 'Islamic Quiz', leadingVisible: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD1E7DD), Color(0xFFB7E4C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        category['icon'],
                        color: const Color(0xFF2D6A4F),
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B4332),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
