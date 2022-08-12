import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:networktravels/Screens/routes.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  AutoRouter routes = AutoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Travels',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.onGeneratedRoute,
    );
  }
}
