import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/constants.dart';
import '../Components/customappbar.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key, required this.model}) : super(key: key);
  final seatServiceBusPickupmodel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
        child: Stack(children: [
          Container(color: Colors.white),
          Container(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: yellow),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('BOOKING ID',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: blacky)),
                            Text('PNR - 1215420',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: blacky,
                                    fontWeight: FontWeight.bold))
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: yellow.withOpacity(0.15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    blacky.withOpacity(0.1),
                                    Colors.grey.shade200,
                                    Colors.white
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 0, top: 10, left: 20, right: 20),
                              child: Column(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Image(
                                      image: AssetImage('assets/logo.png')),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        model.availBuses[model.index].departure
                                            .substring(9, 14),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: DottedLine(
                                            direction: Axis.horizontal,
                                            lineThickness: 2,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text('6h45m'),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: DottedLine(
                                            direction: Axis.horizontal,
                                            lineThickness: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                        model.availBuses[model.index].arival
                                            .substring(9, 14),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(model.from,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Text(model.to,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sunday,24 April',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                        '${model.upperseat.length}(UB),${model.lowerseat.length}(LB)',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total amount :',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        '₹ ${(model.availBuses[model.index].acPrice) * (model.lowerseat.length + model.upperseat.length)}',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Center(
                                  child: DottedLine(
                                    dashLength:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                    direction: Axis.horizontal,
                                    lineThickness: 1,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () async {},
                                  child: Text(
                                    'DOWNLOAD TICKET',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              )
                            ]),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/fare',
                                arguments: model);
                          },
                          child: Text(
                            'DONE',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                    )
                  ]),
                )),
          ),
          Positioned(
              top: 0,
              child: PreferredSize(
                  preferredSize:
                      Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                  child: CustomAppBar(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Text('Order Confirmation',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.2)
                      ],
                    ),
                  ))))
        ]),
      ),
    );
  }
}
