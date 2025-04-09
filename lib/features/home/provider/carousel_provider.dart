import 'package:din_guide_app/constants/app_assets/assets_image.dart';
import 'package:flutter/foundation.dart';

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
    AssetsImage.banner,
    AssetsImage.banner2,
    AssetsImage.banner3,
  ];
}
