import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Auth/Otp/components/phn.dart';
import 'package:networktravels/Screens/Components/custom_bus.dart';
import 'package:networktravels/constants.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
        bottom: false,
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(250, 208, 8, 1),
                  Color.fromRGBO(250, 168, 8, 1)
                ])),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PreferredSize(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  child: Row(children: [
                                    Icon(Icons.chevron_left),
                                    Text('Back',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                            )
                          ]),
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.1)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 47),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome to',
                            style: GoogleFonts.montserrat(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('NETWORK ',
                                style: GoogleFonts.montserrat(
                                    fontSize: 28, fontWeight: FontWeight.bold)),
                            Text('TRAVELS',
                                style: GoogleFonts.montserrat(fontSize: 24)),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 47),
                    child: PhoneForm(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  CustomBus()
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
