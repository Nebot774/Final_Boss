import 'package:flutter/material.dart';
import 'package:final_boss/models/item.dart';

// Puede ir en un archivo dedicado bajo el directorio lib/models
class ItemDestination {
  final Item item;
  final Widget destinationPage;

  ItemDestination({required this.item, required this.destinationPage});
}