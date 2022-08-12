import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Components/custom_bus.dart';
import 'package:networktravels/Screens/Splash%20Screen/components/custom_marker.dart';
import 'package:networktravels/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> anim;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    anim = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        if (anim.isCompleted) {
          Navigator.pushReplacementNamed(context, '/onboard1');
        }
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(250, 208, 8, 1),
              Color.fromRGBO(250, 168, 8, 1)
            ])),
        child: AnimatedOpacity(
          opacity: anim.value,
          duration: Duration(seconds: 3),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image(
                    image: AssetImage('assets/logo.png')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage('assets/map.png'),
                            colorBlendMode: BlendMode.colorDodge,
                            fit: BoxFit.fill,
                          )),
                      CustomMarker(align: Alignment.topRight),
                      CustomMarker(align: Alignment.centerLeft),
                      CustomMarker(align: Alignment.center),
                      CustomMarker(align: Alignment.bottomCenter),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('ON THE ROAD FOR',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 24, color: blacky))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('30 YEARS',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 46,
                                          color: blacky,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CustomBus()
              ]),
        ),
      ),
    );
  }
}
