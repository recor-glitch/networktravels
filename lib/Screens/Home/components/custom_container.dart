import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.bgimg})
      : super(key: key);
  final String title;
  final String subtitle;
  final String bgimg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/seat');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: blacky, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(250, 208, 8, 0.15))),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/conbg.png'))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Text(subtitle,
                            style: GoogleFonts.montserrat(fontSize: 8),
                            maxLines: 3),
                      ),
                      Expanded(
                          child: Image(
                              image: AssetImage(bgimg),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.height * 0.06))
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/phn');
                        },
                        child: Text(
                          'KNOW MORE',
                          style: GoogleFonts.montserrat(
                              fontSize: 8, fontWeight: FontWeight.w500),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
