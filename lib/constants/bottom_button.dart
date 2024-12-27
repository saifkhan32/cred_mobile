import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  
  final String title;

  const BottomButton({super.key, required  this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return     Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              
              
              child:  ClipRRect(
                   
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xFF3949AB),
                      child:  Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
  }
}