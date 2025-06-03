import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../features/tasbih/tasbih_provider.dart';

List<SingleChildWidget> providerLists = [
  ChangeNotifierProvider(create: (context) => TasbihProvider()),
];
