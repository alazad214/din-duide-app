import 'package:flutter/foundation.dart';

import '../../../constants/app_assets/assets_image.dart';

class CarouselProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  List carouselList = [
    AssetsImage.sliderImage,
    AssetsImage.sliderImage,
    AssetsImage.sliderImage,
  ];
}
