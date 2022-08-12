import 'package:flutter/material.dart';

class SeatManagement2Provider extends ChangeNotifier {
  List<int> indexes = [];

  void updateIndexes(int index) {
    if (indexes.contains(index)) {
      indexes.remove(index);
    } else {
      indexes.add(index);
    }
    notifyListeners();
  }
}
