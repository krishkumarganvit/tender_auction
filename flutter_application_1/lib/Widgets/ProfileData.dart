import 'package:flutter/material.dart';

class Profiledata {
  final String title;
  final dynamic value;
  final Icon icon;
  final bool isEaditable;
  Profiledata({
    required this.title,
    required this.value,
    required this.icon,
    this.isEaditable = false,
  });
}
