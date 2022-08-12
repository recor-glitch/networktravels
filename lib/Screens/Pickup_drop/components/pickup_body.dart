import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Provider/Pickup&Dropoff/pickup_provider.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class PickupBody extends StatefulWidget {
  const PickupBody({Key? key}) : super(key: key);

  @override
  State<PickupBody> createState() => _PickupBodyState();
}

class _PickupBodyState extends State<PickupBody>
    with SingleTickerProviderStateMixin {
  late TabController _tripcontroller;
  List<DropDownValueModel> items = [
    DropDownValueModel(name: 'Jorhat bus stand', value: 1),
    DropDownValueModel(name: 'Jalukbari bus stand', value: 2),
    DropDownValueModel(name: 'Khanapara bus stand', value: 3),
    DropDownValueModel(name: 'Random bus stand', value: 4)
  ];

  @override
  void initState() {
    _tripcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tripcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text('Select pickup point',
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Consumer<PickupProvider>(
          builder: (context, pickupvalue, child) => DropDownTextField(
              onChanged: (value) {
                if (value.runtimeType == DropDownValueModel) {
                  pickupvalue.updatePick(value.name);
                } else {
                  pickupvalue.updatePick('');
                }
              },
              textFieldDecoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(239, 235, 235, 1),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintStyle: GoogleFonts.montserrat(fontSize: 12)),
              dropDownList: items),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text('Select dropoff point',
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Consumer<PickupProvider>(
          builder: (context, dropvalue, child) => DropDownTextField(
              onChanged: (value) {
                if (value.runtimeType == DropDownValueModel) {
                  dropvalue.updatePick(value.name);
                } else {
                  dropvalue.updatePick('');
                }
              },
              textFieldDecoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(239, 235, 235, 1),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintStyle: GoogleFonts.montserrat(fontSize: 12)),
              dropDownList: items),
        )
      ],
    );
  }
}
