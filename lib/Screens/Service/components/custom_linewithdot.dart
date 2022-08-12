import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class CustomDotLine extends StatelessWidget {
  const CustomDotLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(color: blacky),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.height * 0.02,
            decoration: BoxDecoration(shape: BoxShape.circle, color: yellow),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          // Center(
          //     heightFactor: 1,
          //     child: Text('7h45m', style: GoogleFonts.montserrat(fontSize: 8)))
        ],
      ),
    );
  }
}
