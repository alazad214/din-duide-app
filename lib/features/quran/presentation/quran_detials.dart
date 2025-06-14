import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/features/quran/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/features/quran/model/quran_details_model.dart';
import 'package:din_guide_app/features/quran/service.dart';
// import 'package:iconsax/iconsax.dart';

class SurahDetailScreen extends StatefulWidget {
  final String surahName;
  const SurahDetailScreen({super.key, required this.surahName});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen>
    with TickerProviderStateMixin {
  ShurahDetailsModel? surahDetails;
  late AudioPlayer _audioPlayer;
  // bool _isPlaying = false;
  // Duration _totalDuration = Duration.zero;
  // Duration _currentPosition = Duration.zero;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Set up audio player listeners
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        // _totalDuration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        // _currentPosition = position;
      });
    });
  }

  // void _togglePlayPause(String audioUrl) {
  //   setState(() {
  //     if (_isPlaying) {
  //       _audioPlayer.pause();
  //     } else {
  //       _audioPlayer.play(UrlSource(audioUrl));
  //     }
  //     _isPlaying = !_isPlaying;
  //   });
  // }

  // void _seekTo(Duration position) {
  //   _audioPlayer.seek(position);
  // }

  // void _showAudioDialog(BuildContext context, String audioUrl) {
  //   _audioPlayer.stop();
  //   _audioPlayer.setSourceUrl(audioUrl);

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text("Playing ${widget.surahName}"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             StreamBuilder<Duration>(
  //               stream: _audioPlayer.onPositionChanged,
  //               builder: (context, snapshot) {
  //                 final position = snapshot.data ?? _currentPosition;
  //                 return Column(
  //                   children: [
  //                     Slider(
  //                       value: position.inSeconds.toDouble(),
  //                       max: _totalDuration.inSeconds.toDouble(),
  //                       onChanged: (value) {
  //                         _seekTo(Duration(seconds: value.toInt()));
  //                       },
  //                       activeColor: AppColors.primaryColor,
  //                     ),
  //                     Text(
  //                       "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / "
  //                       "${_totalDuration.inMinutes}:${(_totalDuration.inSeconds % 60).toString().padLeft(2, '0')}",
  //                     ),
  //                   ],
  //                 );
  //               },
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 IconButton(
  //                   icon: Icon(
  //                     _isPlaying ? Icons.pause : Icons.play_arrow,
  //                     size: 40,
  //                     color: AppColors.primaryColor,
  //                   ),
  //                   onPressed: () => _togglePlayPause(audioUrl),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _audioPlayer.stop();
  //               setState(() {
  //                 _isPlaying = false;
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text("Close"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    _rotateController.dispose();
    super.dispose();
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
          log('audio url: ${surahDetails?.audio ?? ''}');

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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primaryColor,
      //   onPressed: () {
      //     if (surahDetails?.audio != null && surahDetails!.audio!.isNotEmpty) {
      //       _showAudioDialog(context, surahDetails!.audio!);
      //     } else {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text("Audio URL not available")),
      //       );
      //     }
      //   },
      //   child: const Icon(Iconsax.audio_square, color: AppColors.cWhite),
      // ),
    );
  }
}
