import 'package:flutter/material.dart';

const Color yellow = Color.fromRGBO(250, 208, 8, 1);
const Color blacky = Color.fromRGBO(33, 29, 29, 1);
const Color green = Color.fromRGBO(0, 170, 99, 1);

const String neccessaryfields = 'All the fields are required!';
const String sameaddress = 'Departure and Arival cannot be the same.';

const List spaceBusIndexes = [
  0,
  3,
  6,
  9,
  12,
  15,
  18,
  21,
  24,
  27,
  30,
  33,
  36,
  39,
  42
];

const dumydata = {
  'places': [
    'Guwahati',
    'Jorhat',
    'Tinsukia',
    'Sivsagar',
    'Jakhalabandha',
    'Nagaon',
    'Morigaon',
    'Numoligar',
    'Moran',
    'Dhemaji',
    'Titabor',
    'Golaghat',
    'Nalbari',
    'Patsala',
    'Dhubri',
    'Silchar',
    'Karbi Alang',
    'Lakhimpur',
    'Dibrugarh'
  ],
  'buses': [
    {
      'from': 'Guwahati',
      'morning': false,
      'to': 'Jorhat',
      'will_return': false,
      'ac': true,
      'avail_seat': 20,
      'lower_occupied': [1, 7, 8],
      'upper_occupied': [1, 3, 30],
      'lower_berth': 33,
      'upper_berth': 20,
      'departure': '22-08-11 07:00:00',
      'arival': '22-08-09 19:30:00',
      'amenities': [
        'Fan',
        'Window screen',
        'Charging port',
        'Tv',
        'Music system'
      ],
      'price': 470.00,
      'ac_price': 6500.00,
      'rest': 'Khanapara'
    },
    {
      'from': 'Guwahati',
      'morning': true,
      'to': 'Jorhat',
      'will_return': false,
      'ac': true,
      'avail_seat': 28,
      'lower_occupied': [1, 7, 8],
      'upper_occupied': [1, 3, 30],
      'lower_berth': 33,
      'upper_berth': 20,
      'departure': '22-08-11 05:00:00',
      'arival': '22-08-09 15:30:00',
      'amenities': [
        'Fan',
        'Window screen',
        'Charging port',
        'Tv',
        'Music system'
      ],
      'price': 450.00,
      'ac_price': 550.00,
      'rest': 'Khanapara'
    },
    {
      'from': 'Tinsukia',
      'morning': false,
      'to': 'Sivsagar',
      'will_return': false,
      'ac': true,
      'avail_seat': 28,
      'lower_occupied': [1, 10, 8],
      'upper_occupied': [1, 3, 30],
      'lower_berth': 33,
      'upper_berth': 20,
      'departure': '22-08-11 05:00:00',
      'arival': '22-08-15 05:30:00',
      'amenities': [
        'Fan',
        'Window screen',
        'Charging port',
        'Tv',
        'Music system'
      ],
      'price': 600.00,
      'ac_price': 480.00,
      'rest': 'Khanapara'
    }
  ]
};
