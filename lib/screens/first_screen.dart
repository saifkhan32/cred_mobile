import 'dart:math';
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:cred_mobile/widgets/dial_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';


class CreditSelector extends StatefulWidget {
  final bool completedInfo;
 
  final ItemData? item;
   const CreditSelector({super.key, required this.completedInfo, required this.item});

  @override
  State<CreditSelector> createState() => _CreditSelectorState();
}

class _CreditSelectorState extends State<CreditSelector> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _creditAmount = 150000;
  double _dialValue = 0.3; // 0.0 to 1.0
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleProceed() {
    _controller.forward();
    setState(() {
      
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 34, 36, 43),
      body: 
          widget.completedInfo == true  ?   _displayExpandedInfo() : _handleProceed() ?? SlideTransition(
            
          position: Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
          child: _displayCollapsedInfo())
        );
  }
  _displayCollapsedInfo() {
    final totalItems = widget.item!.items![0].closedState;
    return totalItems == null ? const Loader() : Column(
        children: [
         
        GestureDetector(
            onTap: () {
                Provider.of<MyModel>(context, listen: false).value--;
                _controller.reverse();
              setState(() {
            
            }); },
             child: Container(
                      width: MediaQuery.sizeOf(context).width,
                     height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  offset: const Offset(4, 4), // Shadow offset (horizontal, vertical)
                  blurRadius: 8, // Blur radius
                  spreadRadius: 2, // Spread radius
                ),]),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Column(
                      children: [
                      Padding(
             
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                                  totalItems.body!.key1!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                      ),
                                 RichText(text: TextSpan(text: '₹',
                                        style: const TextStyle(fontSize: 13,color: Colors.grey),
                                        children: [
                                          TextSpan(text: 
                                            numberFormat.format( _creditAmount.toInt()).toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                            ),
                                          ),
                                        ]),),
                      
                  ]),
                    Padding
                    (
                      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
                      child: const Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.grey,))
                  ],
                ),
              ),
           ),
         

      ]);
    
  }
  _displayExpandedInfo()
  {
    final totalItems = widget.item!.items![0].openState;
    return  totalItems == null ? const Loader() :  
    Container(
          width: MediaQuery.sizeOf(context).width,
           padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: BorderRadius.circular(12),),
    
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                  const SizedBox(height: 10,),
                  
                          Text(
                        totalItems.body!.title!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 103, 146, 158),
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                                      ),
                                      ),
                                              const SizedBox(height: 3),
                        Text(
                        totalItems.body!.subtitle!,
                        style: TextStyle(
                            color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          )],
                                                                   ),
                          const SizedBox(height: 10,),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                         
                            const SizedBox(height: 24),
                            // Circular Dial
                            SizedBox(
                              height: 250,
                              width: 250,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  final box = context.findRenderObject() as RenderBox;
                                  final center = box.size.center(Offset.zero);
                                  final position = details.localPosition;
                                  final angle = atan2(
                                    position.dy - center.dy,
                                    position.dx - center.dx,
                                  );
                                  setState(() {
                                    _dialValue = (angle / (2 * pi) + 0.5) % 1.0;
                                    _creditAmount = totalItems.body!.card!.minRange! + (_dialValue * totalItems.body!.card!.maxRange!);
                                  });
                                },
                                child: CustomPaint(
                                  painter: DialPainter(
                                    progress: _dialValue,
                                    backgroundColor: const Color.fromARGB(255, 175, 109, 85).withOpacity(0.3),
                                    progressColor: const Color.fromARGB(255, 219, 121, 85),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          totalItems.body!.card!.header!,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 10,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        RichText(text: TextSpan(text: '₹',
                                      style: const TextStyle(fontSize: 18,color: Colors.black),
                                      children: [
                                        TextSpan(text: 
                                          numberFormat.format( _creditAmount.toInt()).toString(),
                                          style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Color.fromARGB(255, 114, 160, 5),
                                            decorationStyle: TextDecorationStyle.dotted,
                                            color: Colors.black
                                          ),
                                        ),
                                      ]),),
                                     
                                        const SizedBox(height: 8),
                                         Text(
                                          totalItems.body!.card!.description!,
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              totalItems.body!.footer!,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 146, 144, 144),
                                fontSize: 12,
                                
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                
                  
                  const SizedBox(height: 16),
                  
                  
                  ],
                
              ),
            
    );
  }
}

