import 'package:audioplayers/audioplayers.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/features/quran/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/features/quran/model/quran_details_model.dart';
import 'package:din_guide_app/features/quran/service.dart';
import 'package:iconsax/iconsax.dart';

class SurahDetailScreen extends StatefulWidget {
  final String surahName;
  const SurahDetailScreen({super.key, required this.surahName});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  ShurahDetailsModel? surahDetails;

  // Function to show the audio dialog
  void _showAudioDialog(BuildContext context, String audioUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Audio Player"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Playing audio for ${widget.surahName}..."),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  _audioPlayer.play(UrlSource(audioUrl));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.pause,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  _audioPlayer.pause();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.stop,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  _audioPlayer.stop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _audioPlayer.stop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.surahName, leadingVisible: true),
      body: FutureBuilder<ShurahDetailsModel>(
        future: QuranDetailsService().getSurah(widget.surahName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildShimmerList();
          } else if (snapshot.hasError) {
            return Center(child: Text("ত্রুটি ঘটেছে: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("কোনো তথ্য পাওয়া যায়নি।"));
          }

          surahDetails = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.cWhite,
                  border: Border.all(color: Colors.black26, width: 0.5),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bg3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        surahDetails?.surahName ?? 'N/A',
                        style: const TextStyle(
                          color: AppColors.cWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              ...List.generate(surahDetails?.surah?.length ?? 0, (index) {
                final ayah = surahDetails?.surah![index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,

                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.teal.shade50,
                            child: Text(
                              "${ayah!.verse}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.menu_book,
                            size: 18,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        ayah.arabic ?? '',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Amiri',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "বাংলা: ${ayah.bangla ?? ''}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "English: ${ayah.english ?? ''}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAudioDialog(context, surahDetails!.audio.toString());
        },
        child: const Icon(Iconsax.audio_square),
      ),
    );
  }
}
