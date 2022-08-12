import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Provider/Seat/seat_management1.dart';
import 'package:networktravels/Screens/Seat/components/alongated_seat.dart';
import 'package:networktravels/Screens/Seat/components/seats.dart';
import 'package:networktravels/constants.dart';
import 'package:provider/provider.dart';
import '../../../Provider/Seat/seat_management2.dart';

class SeatContainer extends StatelessWidget {
  const SeatContainer(
      {Key? key,
      required this.upper,
      required this.seats,
      required this.invalidseats})
      : super(key: key);
  final bool upper;
  final int seats;
  final List invalidseats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upper ? 'Upper berth' : 'Lower berth',
          style:
              GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: yellow)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  upper
                      ? SizedBox(height: 19, width: 19)
                      : Image(
                          image: AssetImage('assets/steering_wheel.png'),
                          height: 19,
                          width: 19)
                ],
              ),
              upper
                  ? Consumer<SeatManagement2Provider>(
                      builder: ((context, seatvalue2, child) => Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GridView.custom(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverQuiltedGridDelegate(
                                        crossAxisSpacing:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        mainAxisSpacing:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        crossAxisCount: 4,
                                        pattern: [
                                          QuiltedGridTile(1, 2),
                                          QuiltedGridTile(1, 1),
                                          QuiltedGridTile(1, 1)
                                        ]),
                                    childrenDelegate:
                                        SliverChildBuilderDelegate(
                                            childCount: seats,
                                            (context, index) => upper
                                                ? AlongatedSeat(
                                                    press: () {
                                                      invalidseats
                                                              .contains(index)
                                                          ? null
                                                          : seatvalue2
                                                              .updateIndexes(
                                                                  index);
                                                    },
                                                    index: index.toString(),
                                                    isclicked: seatvalue2
                                                        .indexes
                                                        .contains(index),
                                                    isred: invalidseats
                                                            .contains(index)
                                                        ? true
                                                        : false,
                                                  )
                                                : Seats(
                                                    isclicked: seatvalue2
                                                        .indexes
                                                        .contains(index),
                                                    press: () {
                                                      invalidseats
                                                              .contains(index)
                                                          ? null
                                                          : seatvalue2
                                                              .updateIndexes(
                                                                  index);
                                                    },
                                                    isred: invalidseats
                                                            .contains(index)
                                                        ? true
                                                        : false,
                                                    index: index.toString()))),
                              ],
                            ),
                          )))
                  : Consumer<SeatManagementProvider>(
                      builder: ((context, seatvalue, child) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GridView.custom(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverQuiltedGridDelegate(
                                    crossAxisSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    mainAxisSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    crossAxisCount: 4,
                                    pattern: [
                                      QuiltedGridTile(1, 2),
                                      QuiltedGridTile(1, 1),
                                      QuiltedGridTile(1, 1)
                                    ]),
                                childrenDelegate: SliverChildBuilderDelegate(
                                    childCount: seats,
                                    (context, index) => upper
                                        ? AlongatedSeat(
                                            press: () {
                                              invalidseats.contains(index)
                                                  ? null
                                                  : seatvalue
                                                      .updateIndexes(index);
                                            },
                                            index: index.toString(),
                                            isclicked: seatvalue.indexes
                                                .contains(index),
                                            isred: invalidseats.contains(index)
                                                ? true
                                                : false,
                                          )
                                        : Seats(
                                            isclicked: seatvalue.indexes
                                                .contains(index),
                                            press: () {
                                              invalidseats.contains(index)
                                                  ? null
                                                  : seatvalue
                                                      .updateIndexes(index);
                                            },
                                            isred: invalidseats.contains(index)
                                                ? true
                                                : false,
                                            index: index.toString()))),
                          ],
                        ),
                      );
                    }))
            ]),
          ),
        ),
      ],
    );
  }
}
