
import 'dart:convert';

Busmodel busmodelFromMap(String str) => Busmodel.fromMap(json.decode(str));

String busmodelToMap(Busmodel data) => json.encode(data.toMap());

class Busmodel {
  Busmodel(
      {required this.from,
      required this.to,
      required this.willReturn,
      required this.ac,
      required this.availSeat,
      required this.lowerOccupied,
      required this.upperOccupied,
      required this.lowerBerth,
      required this.upperBerth,
      required this.departure,
      required this.arival,
      required this.amenities,
      required this.price,
      required this.acPrice,
      required this.morning,
      required this.rest});

  String from;
  String to;
  bool willReturn;
  bool ac;
  int availSeat;
  List<int> lowerOccupied;
  List<int> upperOccupied;
  int lowerBerth;
  int upperBerth;
  String departure;
  String arival;
  List<String> amenities;
  double price;
  double acPrice;
  bool morning;
  String rest;

  factory Busmodel.fromMap(Map<String, dynamic> json) => Busmodel(
        from: json["from"],
        to: json["to"],
        willReturn: json["will_return"],
        ac: json["ac"],
        availSeat: json["avail_seat"],
        lowerOccupied: List<int>.from(json["lower_occupied"].map((x) => x)),
        upperOccupied: List<int>.from(json["upper_occupied"].map((x) => x)),
        lowerBerth: json["lower_berth"],
        upperBerth: json["upper_berth"],
        departure: json["departure"],
        arival: json["arival"],
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        price: json["price"],
        acPrice: json["ac_price"],
        morning: json["morning"],
        rest: json["rest"]
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "will_return": willReturn,
        "ac": ac,
        "avail_seat": availSeat,
        "lower_occupied": List<dynamic>.from(lowerOccupied.map((x) => x)),
        "upper_occupied": List<dynamic>.from(upperOccupied.map((x) => x)),
        "lower_berth": lowerBerth,
        "upper_berth": upperBerth,
        "departure": departure,
        "arival": arival,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "price": price,
        "ac_price": acPrice,
        "morning": morning,
        "rest": rest,
      };
}
