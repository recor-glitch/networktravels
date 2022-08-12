import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/constants.dart';

class AmenetiesContainer extends StatelessWidget {
  const AmenetiesContainer({Key? key, required this.img, required this.txt})
      : super(key: key);
  final String img, txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: yellow.withOpacity(0.15)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(image: AssetImage(img), height: 22, width: 22),
          Text(txt,
              style: GoogleFonts.montserrat(fontSize: 8),
              maxLines: 2,
              textAlign: TextAlign.center)
        ]),
      ),
    );
  }
}
