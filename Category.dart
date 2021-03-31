

import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  Color colour;

  Category({
    @required this.id,
    @required this.title,
    this.colour = Colors.blue
  });
}


