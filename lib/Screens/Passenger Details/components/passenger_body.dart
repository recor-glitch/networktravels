import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/add_coupons.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/coupons.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/custom_container3.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/switch.dart';
import '../../../Models/servicemodel.dart';

class PassengerBody extends StatefulWidget {
  const PassengerBody({Key? key, required this.model}) : super(key: key);
  final seatServiceBusPickupmodel model;

  @override
  State<PassengerBody> createState() => _PassengerBodyState();
}

class _PassengerBodyState extends State<PassengerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Contact information :',
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Email address',
              filled: true,
              fillColor: Color.fromRGBO(239, 235, 235, 1),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintStyle: GoogleFonts.montserrat(fontSize: 12)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Mobile number',
              filled: true,
              fillColor: Color.fromRGBO(239, 235, 235, 1),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintStyle: GoogleFonts.montserrat(fontSize: 12)),
        ),
        CustomSwitch(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text('Passenger details :',
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        CustomContainer3(model: widget.model),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text('Coupons :',
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Coupons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        AddCoupons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text(
            'By clicking on next, I agree to all the terms & condition and privacy policy',
            style: GoogleFonts.montserrat(
                fontSize: 12, fontWeight: FontWeight.normal))
      ],
    );
  }
}
