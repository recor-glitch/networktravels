import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:networktravels/Provider/filter/bus_filterprovider.dart';
import 'package:networktravels/Screens/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  AutoRouter routes = AutoRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusFilterProvider(),
      child: MaterialApp(
        title: 'Network Travels',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.onGeneratedRoute,
      ),
    );
  }
}
