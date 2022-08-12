import 'package:flutter/cupertino.dart';

class SeatManagementProvider extends ChangeNotifier {
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
