import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderRadio extends StatefulWidget {
  const GenderRadio({Key? key}) : super(key: key);

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  int groupval = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text('Male', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500)),
              value: 0,
              groupValue: groupval,
              onChanged: (value) => setState(() {
                    groupval = value as int;
                  })),
        ),
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text('Female', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500)),
              value: 1,
              groupValue: groupval,
              onChanged: (value) => setState(() {
                    groupval = value as int;
                  })),
        )
      ],
    );
  }
}
