import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.scaffoldkey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    Widget customdrawerbutton(
            {required String head,
            String? sub,
            required Function() press,
            required bool iscolor,
            required Widget prefix}) =>
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
              leading: prefix,
              onTap: press,
              title: Text(head, style: GoogleFonts.montserrat()),
              subtitle: sub == null
                  ? null
                  : Text(sub, style: GoogleFonts.montserrat())),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: iscolor ? Colors.white : Colors.transparent),
        );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(250, 208, 8, 1),
            Color.fromRGBO(250, 168, 8, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
        child: ListView(shrinkWrap: true, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    scaffoldkey.currentState!.closeDrawer();
                  },
                  icon: Icon(Icons.clear))
            ],
          ),
          customdrawerbutton(
              head: 'Hi Rishi',
              press: () {},
              iscolor: true,
              sub: '8638972974',
              prefix: CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.grey.shade200)),
          Divider(thickness: 1, color: blacky.withOpacity(0.5)),
          customdrawerbutton(
              head: 'Bookings',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.local_movies)),
          customdrawerbutton(
              head: 'My Wallet',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.wallet)),
          customdrawerbutton(
              head: 'Get ticket details',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.work)),
          customdrawerbutton(
              head: 'Cancel ticket',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.work)),
          customdrawerbutton(
              head: 'Help & support',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.help)),
          customdrawerbutton(
              head: 'Share',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.share)),
          customdrawerbutton(
              head: 'Terms & condition',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.description)),
          customdrawerbutton(
              head: 'About us',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.info)),
          customdrawerbutton(
              head: 'Logout',
              press: () {},
              iscolor: true,
              prefix: Icon(Icons.logout)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('v1.2.1',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.w500))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
