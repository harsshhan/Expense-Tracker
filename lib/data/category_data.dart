import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, Map<String, dynamic>> categoryData = {
  'Food': {
    'icon': const FaIcon(FontAwesomeIcons.burger, color: Colors.white),
    'color': Colors.yellow,
  },
  'Shopping': {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping, color: Colors.white),
    'color': Colors.purple,
  },
  'Health': {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck, color: Colors.white),
    'color': Colors.green,
  },
  'Travel': {
    'icon': const FaIcon(FontAwesomeIcons.plane, color: Colors.white),
    'color': Colors.blue,
  },
};