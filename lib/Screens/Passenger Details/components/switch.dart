import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Send booking details & updates on Whatsapp',
          style: GoogleFonts.montserrat(
              fontSize: 12, fontWeight: FontWeight.w500)),
      trailing: Switch(
          activeColor: green,
          value: val,
          onChanged: (value) => setState(() {
                if (val) {
                  val = false;
                } else {
                  val = true;
                }
              })),
    );
  }
}
