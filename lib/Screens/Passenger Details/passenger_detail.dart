import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/passenger_body.dart';
import 'package:networktravels/constants.dart';
import '../Components/customappbar.dart';
import '../Home/components/custombottom.dart';

class PassengerDetailPage extends StatelessWidget {
  const PassengerDetailPage({Key? key, required this.model}) : super(key: key);
  final seatServiceBusPickupmodel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: PassengerBody(model: model),
                ),
              ),
            )),
        Positioned(
            top: 0,
            child: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                child: CustomAppBar(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Platform.isAndroid
                              ? Icon(Icons.arrow_back)
                              : Icon(Icons.arrow_back_ios_new)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text('Passenger detail',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1)
                    ],
                  ),
                )))),
        Positioned(
            bottom: 13,
            left: 11,
            right: 11,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomBottom(
                  child: Row(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '₹ ${(model.availBuses[model.index].acPrice) * (model.lowerseat.length + model.upperseat.length)}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: blacky)),
                          Text(
                              'For ${model.lowerseat.length + model.upperseat.length} seats',
                              style: GoogleFonts.montserrat(fontSize: 10))
                        ]),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(Icons.arrow_drop_up)),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/order',
                            arguments: model),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('NEXT',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.chevron_right, size: 30)
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                )))
      ])),
    );
  }
}
