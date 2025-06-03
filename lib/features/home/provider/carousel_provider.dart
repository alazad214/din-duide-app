import 'package:din_guide_app/core/common/utils/assets_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselIndexProvider = StateProvider<int>((ref) => 0);

List carouselList = [
  AssetsImage.banner,
  AssetsImage.banner2,
  AssetsImage.banner3,
];
