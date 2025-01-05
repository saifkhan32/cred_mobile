import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  int _value = 0; // This is the variable to modify

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();  // Notify listeners (widgets) when the value changes
  }
}