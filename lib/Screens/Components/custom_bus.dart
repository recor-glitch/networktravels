import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBus extends StatelessWidget {
  const CustomBus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        image: AssetImage('assets/bus.png'));
  }
}
