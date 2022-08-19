import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Provider/Service/service_tab.dart';
import 'package:networktravels/Provider/filter/bus_filterprovider.dart';
import 'package:networktravels/Screens/Service/components/custom_container.dart';
import 'package:networktravels/Screens/Service/components/custom_tab.dart';
import 'package:provider/provider.dart';

class ServiceBody extends StatefulWidget {
  const ServiceBody({Key? key, required this.data}) : super(key: key);
  final Servicemodel data;

  @override
  State<ServiceBody> createState() => _ServiceBodyState();
}

class _ServiceBodyState extends State<ServiceBody>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int ac_buses = 0;
  int morning_buses = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    widget.data.availBuses.forEach((bus) {
      if (bus.morning) {
        morning_buses += 1;
      }
      if (bus.ac) {
        ac_buses += 1;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List getFilteredlist(int index, List buses) {
    if (index == 0) {
      return buses.map((e) {
        if (int.parse(e.departure.substring(9, 11)) < 6) {
          return e;
        }
      }).toList();
    } else if (index == 1) {
      return buses.map((e) {
        if (int.parse(e.departure.substring(9, 11)) > 6 &&
            int.parse(e.departure.substring(9, 11)) < 12) {
          return e;
        }
      }).toList();
    } else if (index == 2) {
      return buses.map((e) {
        if (int.parse(e.departure.substring(9, 11)) > 12 &&
            int.parse(e.departure.substring(9, 11)) < 18) {
          return e;
        }
      }).toList();
    } else if (index == 3) {
      return buses.map((e) {
        if (int.parse(e.departure.substring(9, 11)) > 18) {
          return e;
        }
      }).toList();
    } else if (index == 4) {
      return buses.map((e) {
        if (e.ac == true) {
          return e;
        }
      }).toList();
    } else if (index == 5) {
      return buses.map((e) {
        if (e.ac == false) {
          return e;
        }
      }).toList();
    } else if (index == 8) {
      return buses.map((e) {
        if (int.parse(e.arival.substring(9, 11)) < 6) {
          return e;
        }
      }).toList();
    } else if (index == 9) {
      return buses.map((e) {
        if (int.parse(e.arival.substring(9, 11)) > 6 &&
            int.parse(e.arival.substring(9, 11)) < 12) {
          return e;
        }
      }).toList();
    } else if (index == 10) {
      return buses.map((e) {
        if (int.parse(e.arival.substring(9, 11)) > 12 &&
            int.parse(e.arival.substring(9, 11)) < 18) {
          return e;
        }
      }).toList();
    } else if (index == 11) {
      return buses.map((e) {
        if (int.parse(e.arival.substring(9, 11)) > 18) {
          return e;
        }
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ServiceTabProvider(),
      child: Column(
        children: [
          Consumer<ServiceTabProvider>(
            builder: (BuildContext context, servicepro, Widget? child) =>
                TabBar(
                    onTap: (index) => servicepro.changeActiveIndex(index),
                    indicator: BoxDecoration(
                        border: Border.all(style: BorderStyle.none)),
                    controller: controller,
                    tabs: [
                  servicepro.activeindex == 0
                      ? CustomActiveTab(
                          head: 'All',
                          sub: 'Buses',
                          quantity: widget.data.availBuses.length.toString())
                      : CustomInactiveTab(
                          head: 'All',
                          sub: 'Buses',
                          quantity: widget.data.availBuses.length.toString()),
                  servicepro.activeindex == 1
                      ? CustomActiveTab(
                          head: 'AC',
                          sub: 'Buses',
                          quantity: ac_buses.toString())
                      : CustomInactiveTab(
                          head: 'AC',
                          sub: 'Buses',
                          quantity: ac_buses.toString()),
                  servicepro.activeindex == 2
                      ? CustomActiveTab(
                          head: 'Morning',
                          sub: 'Departure',
                          quantity: morning_buses.toString())
                      : CustomInactiveTab(
                          head: 'Morning',
                          sub: 'Departure',
                          quantity: morning_buses.toString())
                ]),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Consumer<ServiceTabProvider>(
            builder: ((context, servicepro, child) => Image(
                image: AssetImage(servicepro.activeindex == 1
                    ? 'assets/line2.png'
                    : servicepro.activeindex == 2
                        ? 'assets/line3.png'
                        : 'assets/line.png'))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Consumer<BusFilterProvider>(
            builder: (context, busfilter, child) {
              List result = [];
              widget.data.availBuses.forEach((element) {
                for (int i = 0; i < busfilter.filters.length; i++) {
                  if (busfilter.filters[i] == true) {
                    result.isNotEmpty
                        ? result.removeWhere((element) => element == null)
                        : null;
                    var data = getFilteredlist(
                        i, result.isNotEmpty ? result : widget.data.availBuses);

                    result = [...data];
                  }
                }
              });
              result.removeWhere((element) => element == null);
              return result.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: result.length,
                      itemBuilder: (BuildContext context, int index) =>
                          CustomContainer2(
                              data: Servicemodel(
                                  availBuses: result,
                                  from: widget.data.from,
                                  to: widget.data.to,
                                  dDate: widget.data.dDate,
                                  rDate: widget.data.rDate),
                              ind: index),
                    )
                  : Column(
                      children: [
                        busfilter.filters.any((element) => element == true)
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('No filtered data!',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12))
                                  ],
                                ),
                              )
                            : Container(),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.data.availBuses.length,
                          itemBuilder: (BuildContext context, int index) =>
                              CustomContainer2(data: widget.data, ind: index),
                        ),
                      ],
                    );
            },
          )
        ],
      ),
    );
  }
}
