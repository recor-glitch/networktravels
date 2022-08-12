import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class AddCoupons extends StatefulWidget {
  const AddCoupons({Key? key}) : super(key: key);

  @override
  State<AddCoupons> createState() => _AddCouponsState();
}

class _AddCouponsState extends State<AddCoupons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Enter a coupon code',
                filled: true,
                fillColor: Color.fromRGBO(239, 235, 235, 1),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintStyle: GoogleFonts.montserrat(fontSize: 12)),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blacky),
              onPressed: () {},
              child: Text('Apply',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
