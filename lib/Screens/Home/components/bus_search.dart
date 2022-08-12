import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Infrastructure/Filter/filter_buses.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Screens/Components/customsnackbar.dart';
import 'package:networktravels/constants.dart';
import 'package:intl/intl.dart';

class BusSearch extends StatefulWidget {
  const BusSearch({Key? key}) : super(key: key);

  @override
  State<BusSearch> createState() => _BusSearchState();
}

class _BusSearchState extends State<BusSearch> {
  late TextEditingController from, to, d_date, r_date;
  late FocusNode d_focus, r_focus;

  @override
  void initState() {
    super.initState();
    from = TextEditingController();
    to = TextEditingController();
    d_date = TextEditingController();
    r_date = TextEditingController();
    d_focus = FocusNode()
      ..addListener(() {
        if (d_focus.hasFocus) {}
      });
    r_focus = FocusNode()..addListener(() {});
  }

  void _getDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023))
        .then((picked) {});
  }

  @override
  void dispose() {
    from.dispose();
    to.dispose();
    d_date.dispose();
    r_date.dispose();
    d_focus.dispose();
    r_focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget vertical_lines = Container(
      height: MediaQuery.of(context).size.height * 0.01,
      width: 2,
      color: blacky,
    );

    Widget customContainer(Color color1, Color color2) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.032,
        width: MediaQuery.of(context).size.height * 0.022,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color1,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                margin: EdgeInsets.only(top: 5),
                height: 5,
                width: 5,
                alignment: Alignment.topCenter,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: color2)),
          ],
        ),
      );
    }

    Widget dateField(TextInputType keyboardtype, FocusNode focusnode,
            TextEditingController controller, String txt) =>
        TextField(
          style: GoogleFonts.montserrat(fontSize: 12),
          controller: controller,
          focusNode: focusnode,
          decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023))
                        .then((picked) {
                      if (picked != null) {
                        controller.text =
                            (DateFormat('yy-MM-dd').format(picked)).toString();
                      } else {
                        return;
                      }
                    });
                  },
                  child: Icon(Icons.event)),
              filled: true,
              fillColor: Color.fromRGBO(239, 235, 235, 1),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintText: txt,
              hintStyle: GoogleFonts.montserrat(fontSize: 12)),
        );

    Widget customtextfield(TextInputType keyboardtype,
        TextEditingController controller, String txt,
        {Icon? sufix}) {
      return TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            keyboardType: keyboardtype,
            controller: controller,
            style: GoogleFonts.montserrat(fontSize: 12),
            decoration: InputDecoration(
                suffixIcon: sufix,
                filled: true,
                fillColor: Color.fromRGBO(239, 235, 235, 1),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: txt,
                hintStyle: GoogleFonts.montserrat(fontSize: 12))),
        debounceDuration: const Duration(milliseconds: 300),
        noItemsFoundBuilder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('no address found!'),
          );
        },
        suggestionsCallback: (pattern) async {
          List data = [];
          dumydata['places']!.forEach((element) {
            if (element
                .toString()
                .toLowerCase()
                .contains(pattern.toLowerCase())) {
              data.add(element);
            }
          });
          return Future.value(data);
        },
        itemBuilder: (context, suggestion) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(suggestion.toString()),
          );
        },
        onSuggestionSelected: (suggestion) {
          controller.text = suggestion.toString();
        },
      );
    }

    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        children: [
          Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customtextfield(TextInputType.streetAddress, from, 'From'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  customtextfield(TextInputType.streetAddress, to, 'To'),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Column(
              children: [
                customContainer(yellow, blacky),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                vertical_lines,
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                vertical_lines,
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                vertical_lines,
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                customContainer(blacky, yellow)
              ],
            )
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              Expanded(
                child: dateField(
                  TextInputType.datetime,
                  d_focus,
                  d_date,
                  'Departure date',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.height * 0.02),
              Expanded(
                child: dateField(
                  TextInputType.datetime,
                  r_focus,
                  r_date,
                  'Return date',
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                if (from.text == '' ||
                    to.text == '' ||
                    d_date.text == '' ||
                    r_date.text == '') {
                  CustomSnackbar(neccessaryfields, context);
                }if (from.text == to.text) {
                  CustomSnackbar(sameaddress, context);
                } else {
                  List l_data = await getBuses(d_date.text, from.text, to.text);
                  Navigator.pushNamed(context, '/service',
                      arguments: Servicemodel(
                          from: from.text,
                          to: to.text,
                          dDate: d_date.text,
                          rDate: r_date.text,
                          availBuses: l_data));
                }
              },
              child: Text(
                'FIND A BUS',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style:
                  ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 0, 0, 1)),
            ),
          )
        ],
      ),
    ));
  }
}
