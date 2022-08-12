import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Screens/Passenger%20Details/components/gender_radio.dart';
import 'package:networktravels/constants.dart';

class CustomContainer3 extends StatelessWidget {
  const CustomContainer3({Key? key, required this.model}) : super(key: key);
  final seatServiceBusPickupmodel model;

  @override
  Widget build(BuildContext context) {
    Widget form = Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.montserrat(
                          fontSize: 12, fontWeight: FontWeight.w500),
                      hintText: 'Full name'),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.montserrat(
                          fontSize: 12, fontWeight: FontWeight.w500),
                      hintText: 'Age'),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Text('Gender :',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w500)),
            Expanded(child: GenderRadio())
          ]),
        )
      ],
    );
    return Container(
      decoration: BoxDecoration(
          color: yellow.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: yellow, width: 1)),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: yellow),
          padding: EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Text('From', style: GoogleFonts.montserrat(fontSize: 10)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(model.from,
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold))
              ],
            ),
            Column(
              children: [
                Text('Seats', style: GoogleFonts.montserrat(fontSize: 10)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                    '${model.lowerseat.length}(UB),${model.upperseat.length}(LB)',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold))
              ],
            ),
            Column(
              children: [
                Text('To', style: GoogleFonts.montserrat(fontSize: 10)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(model.to,
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold))
              ],
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  const Divider(color: yellow, thickness: 2, height: 1),
              itemCount: model.lowerseat.length + model.upperseat.length,
              itemBuilder: (BuildContext context, int index) => form),
        )
      ]),
    );
  }
}
