class Servicemodel {
  Servicemodel({
    required this.from,
    required this.to,
    required this.dDate,
    required this.rDate,
    required this.availBuses,
  });

  final String from;
  final String to;
  final String dDate;
  final String rDate;
  final List availBuses;
}

class ServiceBusmodel {
  ServiceBusmodel(
      {required this.from,
      required this.to,
      required this.dDate,
      required this.rDate,
      required this.availBuses,
      required this.index});

  final String from;
  final String to;
  final String dDate;
  final String rDate;
  final List availBuses;
  final int index;
}

class seatServiceBusmodel {
  seatServiceBusmodel(
      {required this.from,
      required this.to,
      required this.dDate,
      required this.rDate,
      required this.availBuses,
      required this.index,
      required this.lowerseat,
      required this.upperseat});

  final String from;
  final String to;
  final String dDate;
  final String rDate;
  final List availBuses;
  final int index;
  final List lowerseat;
  final List upperseat;
}

class seatServiceBusPickupmodel {
  seatServiceBusPickupmodel(
      {required this.from,
      required this.to,
      required this.dDate,
      required this.rDate,
      required this.availBuses,
      required this.index,
      required this.lowerseat,
      required this.upperseat,
      required this.pickup,
      required this.dropoff});

  final String from;
  final String to;
  final String dDate;
  final String rDate;
  final List availBuses;
  final int index;
  final List lowerseat;
  final List upperseat;
  final String pickup;
  final String dropoff;
}
