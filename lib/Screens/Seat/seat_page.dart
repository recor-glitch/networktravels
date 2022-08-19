import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Provider/Seat/seat_management1.dart';
import 'package:networktravels/Provider/Seat/seat_management2.dart';
import 'package:networktravels/Screens/Seat/components/amenities_container.dart';
import 'package:networktravels/Screens/Seat/components/seat_container.dart';
import 'package:networktravels/constants.dart';
import 'package:provider/provider.dart';

import '../Components/customappbar.dart';
import '../Home/components/custombottom.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({Key? key, required this.busmodel}) : super(key: key);
  final ServiceBusmodel busmodel;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tripcontroller;
  List<String> busassets = [
    'assets/bus1.png',
    'assets/bus2.png',
    'assets/bus3.png',
    'assets/bus4.png'
  ];
  List<String> amenitiesassets = [
    'assets/fan.png',
    'assets/window.png',
    'assets/charger.png',
    'assets/tv.png',
    'assets/speaker.png'
  ];

  @override
  void initState() {
    _tripcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tripcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget IconContainer(String quote, String img) => Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: blacky.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1)
              ]),
          child: Row(children: [
            Image(image: AssetImage(img), height: 16, width: 16),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Text(quote, style: GoogleFonts.montserrat(fontSize: 8))
          ]),
        );
    return ChangeNotifierProvider(
      create: (context) => SeatManagementProvider(),
      child: ChangeNotifierProvider(
        create: (context) => SeatManagement2Provider(),
        child: Scaffold(
          backgroundColor: yellow,
          body: SafeArea(
        bottom: platform? true : false,
              child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: blacky, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TabBar(
                          indicator: BoxDecoration(
                              border: Border.all(width: 1, color: blacky),
                              borderRadius: BorderRadius.circular(10),
                              color: yellow),
                          labelColor: blacky,
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          controller: _tripcontroller,
                          tabs: [Tab(text: 'One way'), Tab(text: 'Return')]),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      children: [
                        Expanded(
                            child: SeatContainer(
                                invalidseats: widget
                                    .busmodel
                                    .availBuses[widget.busmodel.index]
                                    .lowerOccupied,
                                upper: false,
                                seats: widget
                                    .busmodel
                                    .availBuses[widget.busmodel.index]
                                    .lowerBerth)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Expanded(
                            child: SeatContainer(
                                invalidseats: widget
                                    .busmodel
                                    .availBuses[widget.busmodel.index]
                                    .upperOccupied,
                                upper: true,
                                seats: widget
                                    .busmodel
                                    .availBuses[widget.busmodel.index]
                                    .upperBerth))
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text('Rest-stop',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: yellow, width: 2),
                            color: yellow.withOpacity(0.15)),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  widget.busmodel
                                      .availBuses[widget.busmodel.index].rest,
                                  style: GoogleFonts.montserrat(fontSize: 12)),
                              Row(
                                children: [
                                  IconContainer(
                                      'Safety', 'assets/greentick.png'),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03),
                                  IconContainer('Hygiene', 'assets/hygiene.png')
                                ],
                              )
                            ]),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text('Amenities & photos',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: widget
                                  .busmodel
                                  .availBuses[widget.busmodel.index]
                                  .amenities
                                  .length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      mainAxisSpacing:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int l_index) {
                                return AmenetiesContainer(
                                    img: amenitiesassets[l_index],
                                    txt: widget
                                        .busmodel
                                        .availBuses[widget.busmodel.index]
                                        .amenities[l_index]);
                              },
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          Expanded(
                              child: GridView.custom(
                            shrinkWrap: true,
                            gridDelegate: SliverQuiltedGridDelegate(
                                crossAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.02,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.02,
                                crossAxisCount: 3,
                                pattern: [
                                  QuiltedGridTile(3, 2),
                                  QuiltedGridTile(1, 1),
                                  QuiltedGridTile(1, 1),
                                  QuiltedGridTile(1, 1)
                                ]),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: busassets.length,
                                (context, index) => Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  busassets[index]))),
                                    )),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.1),
                    child: CustomAppBar(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Platform.isAndroid
                              ? Icon(Icons.arrow_back)
                              : Icon(Icons.arrow_back_ios_new)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: GoogleFonts.montserrat(fontSize: 8),
                              ),
                              Text(
                                widget.busmodel.from,
                                style: GoogleFonts.montserrat(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text('Departure date',
                                  style: GoogleFonts.montserrat(fontSize: 8)),
                              Text(widget.busmodel.dDate,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To',
                                style: GoogleFonts.montserrat(fontSize: 8),
                              ),
                              Text(
                                widget.busmodel.to,
                                style: GoogleFonts.montserrat(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text('Return date',
                                  style: GoogleFonts.montserrat(fontSize: 8)),
                              Text(widget.busmodel.rDate,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500)),
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
                    child: Consumer<SeatManagement2Provider>(
                      builder: (context, seatvalue2, child) =>
                          Consumer<SeatManagementProvider>(
                        builder: ((context, seatvalue, child) {
                          var price = (widget
                                      .busmodel
                                      .availBuses[widget.busmodel.index]
                                      .acPrice)
                                  .toInt() *
                              (seatvalue.indexes.length +
                                  seatvalue2.indexes.length);
                          return Visibility(
                            visible: seatvalue.indexes.isNotEmpty ||
                                seatvalue2.indexes.isNotEmpty,
                            child: CustomBottom(
                              child: Row(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('₹ $price.00',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: blacky)),
                                      Text(
                                          'For ${seatvalue.indexes.length + seatvalue2.indexes.length} seats',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10))
                                    ]),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05),
                                Column(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Icon(Icons.arrow_drop_up)),
                                  ],
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/pickup',
                                        arguments: seatServiceBusmodel(
                                            from: widget.busmodel.from,
                                            to: widget.busmodel.to,
                                            dDate: widget.busmodel.dDate,
                                            rDate: widget.busmodel.rDate,
                                            availBuses:
                                                widget.busmodel.availBuses,
                                            index: widget.busmodel.index,
                                            lowerseat: seatvalue.indexes,
                                            upperseat: seatvalue2.indexes)),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('NEXT',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          Icon(Icons.chevron_right, size: 30)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          );
                        }),
                      ),
                    )))
          ])),
        ),
      ),
    );
  }
}
