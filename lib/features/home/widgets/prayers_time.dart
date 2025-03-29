
import 'package:din_guide_app/features/home/widgets/salat_popup.dart' show showSalatPopup;
import 'package:flutter/material.dart';

import '../../../constants/app_assets/assets_image.dart' show AssetsImage;

class PrayersTime extends StatefulWidget {
  const PrayersTime({super.key});

  @override
  State<PrayersTime> createState() => _PrayersTimeState();
}

class _PrayersTimeState extends State<PrayersTime> {
  List prayesList = [
    AssetsImage.fajr,
    AssetsImage.jahr,
    AssetsImage.asr,
    AssetsImage.magrib,
    AssetsImage.isha,
  ];

  List prayesName = ['Fajr', 'Zuhr', 'Asr', 'Magrib', 'Isha'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < prayesList.length; i++)
                GestureDetector(
                  onTap: () {
                    showSalatPopup(
                      context,
                      prayesName[i],
                      prayesList[i],
                      'content',
                    );
                  },
                  child: Container(
                    width: 60,
                    margin:const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(prayesList[i]),
                              fit: BoxFit.fill,
                            ),
                            shape:const OvalBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Text(
                            prayesName[i],
                            textAlign: TextAlign.center,
                            style:const TextStyle(
                              color: const Color(0xFF222222),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
