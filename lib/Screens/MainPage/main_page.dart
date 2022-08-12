import 'package:flutter/material.dart';
import 'package:networktravels/Screens/Splash%20Screen/splash_screen.dart';
import 'package:networktravels/constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: Stack(children: [
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
        SplashScreen()
      ]),
    );
  }
}
