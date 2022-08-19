import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class Seats extends StatefulWidget {
  const Seats(
      {Key? key,
      required this.press,
      required this.isclicked,
      required this.index,
      required this.isred})
      : super(key: key);
  final bool isclicked;
  final Function() press;
  final String index;
  final bool isred;

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  @override
  Widget build(BuildContext context) {
    Widget horizontalCOntainer() => Container(
          height: 7,
          width: 25,
          decoration: BoxDecoration(
              color: widget.isred
                  ? Colors.red
                  : widget.isclicked
                      ? green
                      : Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: blacky, width: 1)),
        );

    Widget verticalContainer() => Container(
          margin: EdgeInsets.only(bottom: 2),
          height: 20,
          width: 7,
          decoration: BoxDecoration(
              color: widget.isred
                  ? Colors.red
                  : widget.isclicked
                      ? green
                      : Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: blacky, width: 1)),
        );

    return InkWell(
      onTap: widget.press,
      child: Container(
          child: Stack(children: [
        Container(
          margin: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.isred
                  ? Colors.red
                  : widget.isclicked
                      ? green
                      : Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: blacky, width: 1)),
          child: Center(
              child: Text('${int.parse(widget.index) + 1}',
                  style: GoogleFonts.montserrat(fontSize: 14))),
        ),
        Align(alignment: Alignment.bottomLeft, child: verticalContainer()),
        Align(alignment: Alignment.bottomRight, child: verticalContainer()),
        Align(alignment: Alignment.bottomCenter, child: horizontalCOntainer())
      ])),
    );
  }
}
