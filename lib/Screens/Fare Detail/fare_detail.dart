import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/constants.dart';

import '../Components/customappbar.dart';

class FareDetailPage extends StatelessWidget {
  const FareDetailPage({Key? key, required this.model}) : super(key: key);
  final seatServiceBusPickupmodel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
          child: Stack(children: [
        Container(
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Seats',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Fare',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('${model.lowerseat.length} (lower berth)',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(
                            '₹ ${model.availBuses[model.index].acPrice * model.lowerseat.length}',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('${model.upperseat.length} (upper berth)',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(
                            '₹ ${model.availBuses[model.index].acPrice * model.upperseat.length}',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Basic fare',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(
                            '₹ ${(model.availBuses[model.index].acPrice * model.upperseat.length) + model.availBuses[model.index].acPrice * model.lowerseat.length}',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Divider(color: blacky.withOpacity(0.25), thickness: 2),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Coupon discount',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text('₹ 120.00',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: green)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Total amount',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Text(
                        '₹ ${((model.availBuses[model.index].acPrice * model.upperseat.length) + (model.availBuses[model.index].acPrice * model.lowerseat.length)) - 120}',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
              ]),
        ),
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
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text('Fare details',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2)
                    ],
                  ),
                )))),
      ])),
    );
  }
}
