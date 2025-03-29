import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../features/home/provider/carousel_provider.dart';
import '../features/tasbih/tasbih_provider.dart';
List<SingleChildWidget> providerLists = [
  ChangeNotifierProvider(create: (context) => CarouselProvider()),
  ChangeNotifierProvider(create: (context) => TasbihProvider()),
];
