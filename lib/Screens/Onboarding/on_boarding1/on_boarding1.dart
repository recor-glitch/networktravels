import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Components/custom_rotation_button.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int activeindex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          activeindex = _controller.index;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget Tab1 = Column(
      children: [
        Center(
            child:
                Image(image: AssetImage('assets/move.png'), fit: BoxFit.cover)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Move',
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text('with us.', style: GoogleFonts.montserrat(fontSize: 24)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              'Buy bus tickets easily.You choose the \n destination and we make the rest.',
              style: GoogleFonts.montserrat(fontSize: 14),
            )
          ],
        ),
      ],
    );

    Widget Tab2 = Column(children: [
      Center(
          child:
              Image(image: AssetImage('assets/enjoy.png'), fit: BoxFit.cover)),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enjoy',
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text('your holiday.', style: GoogleFonts.montserrat(fontSize: 24)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Enjoy your best holiday experience with \n NetworkTravels.',
            style: GoogleFonts.montserrat(fontSize: 14),
          )
        ],
      )
    ]);
    Widget bigOne = Container(
      height: 4,
      width: 27,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(55, 55, 55, 1)),
    );
    Widget smallOne = Container(
      height: 4,
      width: 4,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Color.fromRGBO(55, 55, 55, 0.5)),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TabBar(
                            unselectedLabelColor:
                                Color.fromRGBO(114, 109, 109, 1),
                            isScrollable: true,
                            controller: _controller,
                            indicator: BoxDecoration(color: Colors.transparent),
                            tabs: [
                              Tab(child: activeindex == 0 ? bigOne : smallOne),
                              Tab(child: activeindex == 1 ? bigOne : smallOne)
                            ]),
                        Text('Skip',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.bold))
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TabBarView(
                        controller: _controller, children: [Tab1, Tab2])),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: RotationButton(press: () {
                    if (_controller.index == 1) {
                      Navigator.pushReplacementNamed(context, '/signup');
                    } else {
                      _controller.animateTo(1);
                    }
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
