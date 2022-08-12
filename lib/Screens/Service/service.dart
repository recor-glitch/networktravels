import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Screens/Components/customappbar.dart';
import 'package:networktravels/Screens/Home/components/custombottom.dart';
import 'package:networktravels/Screens/Service/components/body.dart';
import 'package:networktravels/constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key, required this.data}) : super(key: key);
  final Servicemodel data;

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with TickerProviderStateMixin {
  late TabController bcontroller;

  @override
  void initState() {
    bcontroller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    bcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ServiceBody(data: widget.data),
              ),
            )),
        Positioned(
            top: 0,
            child: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                child: CustomAppBar(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: GoogleFonts.montserrat(fontSize: 8),
                          ),
                          Text(
                            widget.data.from,
                            style: GoogleFonts.montserrat(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text('Departure date',
                              style: GoogleFonts.montserrat(fontSize: 8)),
                          Text(widget.data.dDate,
                              style: GoogleFonts.montserrat(
                                  fontSize: 10, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: GoogleFonts.montserrat(fontSize: 8),
                          ),
                          Text(
                            widget.data.to,
                            style: GoogleFonts.montserrat(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text('Return date',
                              style: GoogleFonts.montserrat(fontSize: 8)),
                          Text(widget.data.rDate,
                              style: GoogleFonts.montserrat(
                                  fontSize: 10, fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  ),
                )))),
        Positioned(
            bottom: 13,
            left: 11,
            right: 11,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomBottom(
                  child: TabBar(
                      isScrollable: true,
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12, fontWeight: FontWeight.w500),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      controller: bcontroller,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      tabs: [
                    Tab(
                      text: 'AC',
                    ),
                    Tab(text: 'SLEEPER'),
                    Tab(text: 'PICKUP AFTER \n6PM'),
                    Tab(icon: Icon(Icons.tune))
                  ])),
            ))
      ])),
    );
  }
}
