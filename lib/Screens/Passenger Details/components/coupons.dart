import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Coupons extends StatefulWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  int groupval = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          dense: true,
          title: Text('NEWRIDE : Up to Rs 100 OFF on your 1st bus booking.', style: GoogleFonts.montserrat(fontSize: 12)),
            value: 1,
            groupValue: groupval,
            onChanged: (value) => setState(() {
                  groupval = value as int;
                })),
                RadioListTile(
                  dense: true,
                  title: Text("FLAT50 : Flat 50% OFF on bookings before 1st May'21", style: GoogleFonts.montserrat(fontSize: 12)),
            value: 2,
            groupValue: groupval,
            onChanged: (value) => setState(() {
                  groupval = value as int;
                }))
      ],
    );
  }
}
