import 'package:flutter/material.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Provider/Service/service_tab.dart';
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.data.availBuses.length,
            itemBuilder: (BuildContext context, int index) =>
                CustomContainer2(data: widget.data, ind: index),
          )
        ],
      ),
    );
  }
}
