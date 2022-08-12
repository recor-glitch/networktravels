import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class CustomInactiveTab extends StatelessWidget {
  const CustomInactiveTab(
      {Key? key, required this.head, required this.sub, required this.quantity})
      : super(key: key);
  final String head, sub, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 5)),
        BoxShadow(color: yellow, offset: Offset(-5, 0)),
        BoxShadow(color: yellow, offset: Offset(5, 0))
      ], borderRadius: BorderRadius.circular(10), color: yellow),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.3,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(head,
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.bold)),
            Text(sub,
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(quantity,
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.bold))
      ]),
    );
  }
}

class CustomActiveTab extends StatelessWidget {
  const CustomActiveTab(
      {Key? key, required this.head, required this.sub, required this.quantity})
      : super(key: key);
  final String head, sub, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: yellow, width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.3,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(head,
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.bold, color: blacky)),
            Text(sub,
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.bold, color: blacky)),
          ],
        ),
        Text(quantity,
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.bold, color: blacky))
      ]),
    );
  }
}
