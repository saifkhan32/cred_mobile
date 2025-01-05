import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _value = 0; 

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();  
  }
}