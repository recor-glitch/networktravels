import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({Key? key, required this.align}) : super(key: key);
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Align(
          alignment: align,
          child: Image(
              image: AssetImage(
                'assets/marker.png',
              ),
              fit: BoxFit.contain)),
    );
  }
}
