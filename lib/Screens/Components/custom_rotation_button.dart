import 'package:flutter/material.dart';
import 'package:networktravels/constants.dart';

class RotationButton extends StatelessWidget {
  const RotationButton({Key? key, required this.press}) : super(key: key);
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(45 / 360),
      child: InkWell(
        onTap: press,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: yellow),
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(-45 / 360),
              child: Icon(Icons.fast_forward, size: 25)),
        ),
      ),
    );
  }
}
