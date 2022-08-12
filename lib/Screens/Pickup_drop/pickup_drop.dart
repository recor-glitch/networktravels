import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Provider/Pickup&Dropoff/pickup_provider.dart';
import 'package:networktravels/Screens/Components/customsnackbar.dart';
import 'package:networktravels/Screens/Pickup_drop/components/pickup_body.dart';
import 'package:networktravels/constants.dart';
import 'package:provider/provider.dart';
import '../Components/customappbar.dart';
import '../Home/components/custombottom.dart';

class PickupDropPage extends StatelessWidget {
  const PickupDropPage({Key? key, required this.seatmodel}) : super(key: key);
  final seatServiceBusmodel seatmodel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PickupProvider(),
      child: Scaffold(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(children: [PickupBody()]),
                  ),
                ),
              )),
          Positioned(
              top: 0,
              child: PreferredSize(
                  preferredSize:
                      Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                  child: CustomAppBar(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Text('Pickup & drop points',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1)
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
                    child: Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '₹ ${(seatmodel.availBuses[seatmodel.index].acPrice).toInt() * (seatmodel.lowerseat.length + seatmodel.upperseat.length)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: blacky)),
                            Text(
                                'For ${seatmodel.lowerseat.length + seatmodel.upperseat.length} seats',
                                style: GoogleFonts.montserrat(fontSize: 10))
                          ]),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(Icons.arrow_drop_up)),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                        child: Consumer<PickupProvider>(
                          builder: (context, val, child) => InkWell(
                            onTap: () {
                              if (val.pickup != '' || val.dropoff != '') {
                                Navigator.pushNamed(context, '/passenger',
                                    arguments: seatServiceBusPickupmodel(
                                        from: seatmodel.from,
                                        to: seatmodel.to,
                                        dDate: seatmodel.dDate,
                                        rDate: seatmodel.rDate,
                                        availBuses: seatmodel.availBuses,
                                        index: seatmodel.index,
                                        lowerseat: seatmodel.lowerseat,
                                        upperseat: seatmodel.upperseat,
                                        pickup: val.pickup,
                                        dropoff: val.dropoff));
                              } else {
                                CustomSnackbar(
                                    'Pick a pickup and dropoff point!',
                                    context);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
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
                        ),
                      )
                    ]),
                  )))
        ])),
      ),
    );
  }
}
