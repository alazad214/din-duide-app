import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier {
  int _number = 0;
  int get number => _number;

  void countTasbih() {
    _number++;
    notifyListeners();
  }

  void resetTasbih() {
    _number = 0;
    notifyListeners();
  }
}
