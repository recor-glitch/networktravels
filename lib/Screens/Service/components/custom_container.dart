import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Provider/filter/bus_filterprovider.dart';
import 'package:networktravels/Screens/Service/components/custom_linewithdot.dart';
import 'package:networktravels/Screens/Service/components/time_text.dart';
import 'package:networktravels/constants.dart';
import 'package:provider/provider.dart';

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2({Key? key, required this.data, required this.ind})
      : super(key: key);
  final Servicemodel data;
  final int ind;

  @override
  Widget build(BuildContext context) {
    Widget customRow(
            {required String time1,
            required String place1,
            required String time2,
            required String place2}) =>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    TimeText(time: time1, place: place1),
                    CustomDotLine(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    TimeText(time: time2, place: place2)
                  ],
                )
              ],
            )
          ],
        );
    return Consumer<BusFilterProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/seat',
              arguments: ServiceBusmodel(
                  from: data.from,
                  to: data.to,
                  dDate: data.dDate,
                  rDate: data.rDate,
                  availBuses: data.availBuses,
                  index: ind));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: yellow,
              border: Border.all(color: blacky, width: 1)),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.beenhere, color: Colors.white),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Text('Safe & secure',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                      Row(
                        children: [
                          Icon(Icons.gps_fixed, color: Colors.white),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Text('Live tracking',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.06),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(5)),
                          height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Center(
                            child: Text(data.availBuses[ind].availSeat.toString(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 8, fontWeight: FontWeight.bold)),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                  image: AssetImage('assets/busframe.png'),
                                  height: 18,
                                  width: 18),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(TextSpan(
                                        text: 'NETWORK',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: ' TRAVELS',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12))
                                        ])),
                                    data.availBuses[ind].ac
                                        ? Text('AC (2X1)',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                            ))
                                        : Text('NON AC (2X1)',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                            ))
                                  ])
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    customRow(
                                        time1: data.availBuses[ind].departure
                                            .substring(9, 17),
                                        time2: data.availBuses[ind].arival
                                            .substring(9, 17),
                                        place1: data.availBuses[ind].from,
                                        place2: data.availBuses[ind].to),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('₹ ${data.availBuses[ind].price}',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('₹ ${data.availBuses[ind].acPrice}',
                                      style: GoogleFonts.montserrat(
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
