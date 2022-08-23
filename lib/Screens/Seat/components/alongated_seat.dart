import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class AlongatedSeat extends StatelessWidget {
  const AlongatedSeat(
      {Key? key,
      required this.press,
      required this.index,
      required this.isclicked,
      required this.isred})
      : super(key: key);
  final Function() press;
  final String index;
  final bool isclicked;
  final bool isred;

  @override
  Widget build(BuildContext context) {
    Widget horizontalCOntainer() => Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 5,
          width: 20,
          decoration: BoxDecoration(
              color: isred
                  ? Colors.red
                  : isclicked
                      ? green
                      : Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: blacky, width: 1)),
        );
    return InkWell(
      onTap: press,
      child: Container(
        height: 75,
        width: 33.48,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isred
                    ? Colors.red
                    : isclicked
                        ? green
                        : Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: blacky, width: 1)),
            child: Center(
                child: Text('${int.parse(index) + 1}',
                    style: GoogleFonts.montserrat(fontSize: 14))),
          ),
          Align(
              alignment: Alignment.bottomCenter, child: horizontalCOntainer()),
        ]),
      ),
    );
  }
}
