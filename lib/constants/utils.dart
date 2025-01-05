
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

titleText(String title)
{
  return Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 103, 146, 158),
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                        ),
                        );
}
subtitleText(String subtitle)
{
  return  Text(
          subtitle,
          style: TextStyle(
              color: Colors.grey[400],
                fontSize: 12,
              ),
            );
}
