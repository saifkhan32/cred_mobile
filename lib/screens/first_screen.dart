import 'dart:math';
import 'package:cred_mobile/widgets/dial_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreditSelector extends StatefulWidget {
  final bool completedInfo;
  const CreditSelector({super.key, required this.completedInfo});

  @override
  State<CreditSelector> createState() => _CreditSelectorState();
}

class _CreditSelectorState extends State<CreditSelector> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _collapseAnimation;
  bool _showAdditionalCards = false;
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
    _collapseAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleProceed() async {
    await _controller.forward();
    setState(() => _showAdditionalCards = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFF1A1B1E),
      body: SafeArea(
          child: widget.completedInfo || _showAdditionalCards == true ? _displayExpandedInfo() : SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -0.1), end: const Offset(0, 0)).animate(_collapseAnimation),
          child: _displayCollapsedInfo(),)
        ),
      );
  }
  _displayCollapsedInfo() {
    return Column(
        children: [
          const SizedBox(height: 30,),
     
         Container(
          height: 80,
           child: GestureDetector(
            onTap: () {setState(() {
              
            }); },
             child: Card(
              
                color: const Color(0xFF1A1B1E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Column(
                      children: [
                      const Padding(
             
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                                  'credit amount',
                                  style: TextStyle(
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
                    const Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.grey,)
                  ],
                ),
              ),
           ),
         ),

      ]);
    
  }
  _displayExpandedInfo()
  {
    return  
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                SizedBox(height: 10,),
                
                        const Text(
                      'nikunj, how much do you need?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 146, 158),
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                                    ),
                                    ),
                                            const SizedBox(height: 3),
                      Text(
                      'move the dial and set any amount you need upto ₹487,891',
                      style: TextStyle(
                          color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        )],
                                                                 ),
                        SizedBox(height: 10,),
                // Main Credit Selector Card
                // AnimatedBuilder(
                //   animation: _collapseAnimation,
                //   builder: (context, child) => Transform.scale(
                //     scale: _collapseAnimation.value,
                //     child: child,
                //   ),
                  
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Header
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
                                  _creditAmount = 50000 + (_dialValue * 437891);
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
                                        'credit amount',
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
                                      const Text(
                                        '@1.04% monthly',
                                        style: TextStyle(
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
                          const Text(
                            'stash is instant. money will be credited within seconds.',
                            style: TextStyle(
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
                
                // Proceed Button
                
                
               
                ],
              
            ),
          );
  }
}

