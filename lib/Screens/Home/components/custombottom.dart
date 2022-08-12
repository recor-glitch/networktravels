import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:networktravels/constants.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: yellow),
      child: child,
    );
  }
}
