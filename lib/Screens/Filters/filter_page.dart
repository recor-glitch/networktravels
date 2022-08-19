import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Provider/filter/bus_filterprovider.dart';
import 'package:networktravels/constants.dart';
import 'package:provider/provider.dart';
import '../Components/customappbar.dart';
import '../Home/components/custombottom.dart';
import 'dart:io';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
          child: Stack(children: [
        Container(
          color: Colors.white,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 29, vertical: 30),
            child: SingleChildScrollView(
              child: Consumer<BusFilterProvider>(
                  builder: (context, busfilter, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text('DEPARTURE TIME',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[0],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(0),
                                title: Text('Before 6 AM (12)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[1],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(1),
                                title: Text('6 AM to 12 PM (06)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[2],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(2),
                                title: Text('12 PM to 6 PM (08)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[3],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(3),
                                title: Text('After 6 PM (10)')),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text('BUS TYPES',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[4],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(4),
                                title: Text('AC (24)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[5],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(5),
                                title: Text('NON-AC (13)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[6],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(6),
                                title: Text('SLEEPER AC (20)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[7],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(7),
                                title: Text('SLEEPER NON-AC (18)')),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text('ARRIVAL TIME',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[8],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(8),
                                title: Text('Before 6 AM (12)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[9],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(9),
                                title: Text('6 AM to 12 PM (06)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[10],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(10),
                                title: Text('12 PM to 6 PM (08)')),
                            CheckboxListTile(
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: busfilter.filters[11],
                                onChanged: (value) =>
                                    busfilter.updateChecklist(11),
                                title: Text('After 6 PM (10)')),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1)
                          ])),
            )),
        Positioned(
            top: 0,
            child: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                child: CustomAppBar(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Platform.isAndroid
                              ? Icon(Icons.arrow_back)
                              : Icon(Icons.arrow_back_ios_new)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text('Filter & sort by',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2)
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
                    child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () => Navigator.maybePop(context),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('Apply',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: blacky)),
                          )),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('Discard',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: blacky.withOpacity(0.5))),
                          )),
                    ))
                  ],
                ))))
      ])),
    );
  }
}
