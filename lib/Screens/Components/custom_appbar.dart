import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key, required this.page}) : super(key: key);
  final int page;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.page == 1? bigOne : smallOne,
            SizedBox(width: 4),
            widget.page == 1? smallOne : bigOne
          ],
        ),
        Text('Skip',
            style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
