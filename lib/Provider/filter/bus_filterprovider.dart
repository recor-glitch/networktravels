import 'package:flutter/cupertino.dart';

class BusFilterProvider extends ChangeNotifier {
  List<bool> filters = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void updateChecklist(int index) {
    filters[index] = !filters[index];
    notifyListeners();
  }
}
