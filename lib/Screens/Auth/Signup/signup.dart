import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Auth/Signup/components/signup_form.dart';
import 'package:networktravels/Screens/Components/custom_bus.dart';
import 'package:networktravels/constants.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
        bottom: false,
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(250, 208, 8, 1),
                Color.fromRGBO(250, 168, 8, 1)
              ])),
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
              image: AssetImage('assets/map.png'),
              colorBlendMode: BlendMode.dstATop),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PreferredSize(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15))),
                                  child: Row(children: [
                                    Text('Skip',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    Icon(Icons.chevron_right)
                                  ])),
                            )
                          ]),
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.1)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: Text('Create a new \naccount',
                        style: GoogleFonts.montserrat(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SignupForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.32,
                        color: Colors.black,
                      ),
                      Text('or sign up with',
                          style: GoogleFonts.montserrat(fontSize: 12)),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.32,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: SvgPicture.asset('assets/google.svg'),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text('Google',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  CustomBus()
                ],
              ),
            ))
      ])),
    );
  }
}
