import 'package:networktravels/Models/busmodel.dart';
import 'package:networktravels/constants.dart';

Future<List> getBuses(String departure, String from, String to) {
  List data = [];
  for (var element in dumydata['buses']!) {
    var bus = Busmodel.fromMap(element as Map<String, dynamic>);
    if (bus.from.contains(from) && bus.to.contains(to)) {
      data.add(bus);
    }
  }
  return Future.value(data);
}
