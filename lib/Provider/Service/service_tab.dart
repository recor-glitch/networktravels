import 'package:flutter/material.dart';

class ServiceTabProvider extends ChangeNotifier {
  int activeindex = 0;

  void changeActiveIndex(int index) {
    activeindex = index;
    notifyListeners();
  }
}
