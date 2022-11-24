import 'package:flutter/material.dart';

extension RouteX on BuildContext {
  void push(Widget route) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => route));
  }
}
