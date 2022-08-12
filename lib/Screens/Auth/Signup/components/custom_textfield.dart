import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.txt, required this. keyboardtype})
      : super(key: key);
  final TextEditingController controller;
  final String txt;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardtype,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          hintText: txt,
          hintStyle: GoogleFonts.montserrat(fontSize: 12)),
    );
  }
}
