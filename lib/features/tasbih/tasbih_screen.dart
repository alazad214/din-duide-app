import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/features/tasbih/tasbih_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../common_widgets/custom_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_font_style.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> tasbihList = [
    {
      "arabic": "سُبْحَانَ اللَّه",
      "bangla": "সুবহানাল্লাহ",
      "meaning": "পবিত্র আল্লাহ",
    },
    {
      "arabic": "الْحَمْدُ لِلَّه",
      "bangla": "আলহামদুলিল্লাহ",
      "meaning": "সব প্রশংসা আল্লাহর",
    },
    {
      "arabic": "اللَّهُ أَكْبَر",
      "bangla": "আল্লাহু আকবার",
      "meaning": "আল্লাহ সর্বশক্তিমান",
    },
    {
      "arabic": "لَا إِلٰهَ إِلَّا اللَّه",
      "bangla": "লা ইলাহা ইল্লাল্লাহ",
      "meaning": "আল্লাহ ছাড়া কোনো উপাস্য নেই",
    },
    {
      "arabic": "اللهم صل وسلم على سيدنا محمد وعلى آله وصحبه أجمعين",
      "bangla":
          "আল্লাহুম্মা সল্লি আলা সায়্যিদিনা মুহাম্মাদিন ওয়ালা আ-লাইহি ওয়াসাহবিহি আজমাঈন",
      "meaning": "নবী (সাঃ) এর ওপর শান্তি ও সালাম",
    },
    {
      "arabic": "أستغفر الله",
      "bangla": "আস্তাগফিরুল্লাহ",
      "meaning": "আল্লাহর কাছে ক্ষমা প্রার্থনা",
    },
  ];

  void _goToPage(int index) {
    if (index >= 0 && index < tasbihList.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'তাসবিহ কাউন্টার',
        leadingVisible: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed:
                      currentIndex > 0
                          ? () => _goToPage(currentIndex - 1)
                          : null,
                ),
                Expanded(
                  child: SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tasbihList.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = tasbihList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["bangla"]!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              item["meaning"]!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              item["arabic"]!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed:
                      currentIndex < tasbihList.length - 1
                          ? () => _goToPage(currentIndex + 1)
                          : null,
                ),
              ],
            ),

            const Divider(),

            Consumer<TasbihProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Text(
                      provider.number.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(AssetsImage.tasbih, height: 200),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: customButton(
                              name: 'Reset',
                              height: 50,
                              borderColor: AppColors.primaryColor,
                              color: Colors.transparent,
                              textStyle: TextFontStyle.textStyle16w600cFFFFFF
                                  .copyWith(color: AppColors.primaryColor),
                              onCallBack: () {
                                provider.resetTasbih();
                              },
                              context: context,
                            ),
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            child: customButton(
                              name: 'Add',
                              height: 50,
                              onCallBack: () {
                                provider.countTasbih();
                              },
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
