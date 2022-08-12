import 'package:flutter/material.dart';
import 'package:networktravels/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 5,
                  spreadRadius: 1),
              BoxShadow(offset: Offset(-10, 0), color: yellow),
              BoxShadow(offset: Offset(10, 0), color: yellow),
            ],
            color: yellow,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: child);
  }
}
