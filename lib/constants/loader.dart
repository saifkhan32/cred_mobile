import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: const Color(0xFF272B34),
        
        child: LoadingAnimationWidget.horizontalRotatingDots(color: const Color.fromARGB(255, 235, 125, 86), size : 50)),
    );
  }
}