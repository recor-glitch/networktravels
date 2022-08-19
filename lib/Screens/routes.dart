import 'package:flutter/material.dart';
import 'package:networktravels/Models/servicemodel.dart';
import 'package:networktravels/Screens/Auth/Otp/otp.dart';
import 'package:networktravels/Screens/Auth/Otp/phone_number.dart';
import 'package:networktravels/Screens/Auth/Signup/signup.dart';
import 'package:networktravels/Screens/Fare%20Detail/fare_detail.dart';
import 'package:networktravels/Screens/Filters/filter_page.dart';
import 'package:networktravels/Screens/Home/home.dart';
import 'package:networktravels/Screens/MainPage/main_page.dart';
import 'package:networktravels/Screens/Onboarding/on_boarding1/on_boarding1.dart';
import 'package:networktravels/Screens/Passenger%20Details/passenger_detail.dart';
import 'package:networktravels/Screens/Pickup_drop/pickup_drop.dart';
import 'package:networktravels/Screens/Seat/seat_page.dart';
import 'package:networktravels/Screens/Service/service.dart';

import 'Order Confirmation/order_confirmation.dart';

class AutoRouter {
  Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/onboard1':
        return MaterialPageRoute(builder: (_) => Onboarding1());
      case '/signup':
        return MaterialPageRoute(builder: (_) => Signup());
      case '/otp':
        return MaterialPageRoute(builder: (_) => OtpPage());
      case '/phn':
        return MaterialPageRoute(builder: (_) => PhoneNumber());
      case '/filter':
        return MaterialPageRoute(builder: (_) => FilterPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/service':
        var data = settings.arguments as Servicemodel;
        return MaterialPageRoute(builder: (_) => ServicePage(data: data));
      case '/seat':
        var data = settings.arguments as ServiceBusmodel;
        return MaterialPageRoute(builder: (_) => SeatPage(busmodel: data));
      case '/fare':
        var data = settings.arguments as seatServiceBusPickupmodel;
        return MaterialPageRoute(builder: (_) => FareDetailPage(model: data));
      case '/pickup':
        var data = settings.arguments as seatServiceBusmodel;
        return MaterialPageRoute(
            builder: (_) => PickupDropPage(seatmodel: data));
      case '/passenger':
        var data = settings.arguments as seatServiceBusPickupmodel;
        return MaterialPageRoute(
            builder: (_) => PassengerDetailPage(model: data));
      case '/order':
        var data = settings.arguments as seatServiceBusPickupmodel;
        return MaterialPageRoute(
            builder: (_) => OrderConfirmation(model: data));
      default:
        return MaterialPageRoute(builder: (_) => Onboarding1());
    }
  }
}
