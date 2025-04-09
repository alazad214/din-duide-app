import 'dart:math';
import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/constants/app_assets/assets_image.dart';
import 'package:din_guide_app/features/quran/model/quran_model.dart';
import 'package:flutter/material.dart';

class SurahDetailScreen extends StatelessWidget {
  final Surahs surah;
  const SurahDetailScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:  CustomAppbar(title: surah.englishName.toString(), leadingVisible: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image:  DecorationImage(
                    image: AssetImage(AssetsImage.bg3),
                    fit: BoxFit.cover,
                    opacity: 0.2),
                border: Border.all(color: Colors.black12, width: 0.1),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          surah.name ?? 'N/A',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          surah.englishName ?? 'N/A',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Surah",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "${surah.number ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Revelation",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  surah.revelationType ?? 'N/A',
                                  style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Translation",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  surah.englishNameTranslation ?? 'N/A',
                                  style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: surah.ayahs?.length ?? 0,
              itemBuilder: (context, index) {
                var ayah = surah.ayahs![index];
                Color randomColor =
                    Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(0.2);
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12, width: 0.3)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: randomColor,
                      child: Text(
                        "${ayah.numberInSurah}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(' ${ayah.text ?? 'N/A'}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}