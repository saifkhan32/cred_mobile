
import 'package:flutter/material.dart';

String uri = "https://api.mocklets.com/p6764/test_mint";
class Utils {}
void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}



