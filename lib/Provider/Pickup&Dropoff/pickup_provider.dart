import 'package:flutter/cupertino.dart';

class PickupProvider extends ChangeNotifier {
  String pickup = '';
  String dropoff = '';

  void updatePick(String pick) {
    pickup = pick;
    notifyListeners();
  }

  void updatedrop(String drop) {
    dropoff = drop;
    notifyListeners();
  }
}
