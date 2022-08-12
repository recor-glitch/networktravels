import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeText extends StatelessWidget {
  const TimeText({Key? key, required this.time, required this.place})
      : super(key: key);
  final String time, place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.bold)),
          Text(place,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(fontSize: 12))
        ],
      ),
    );
  }
}
