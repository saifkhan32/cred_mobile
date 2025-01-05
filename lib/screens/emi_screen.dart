
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/constants/utils.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:cred_mobile/provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EMISelectionScreen extends StatefulWidget {
  final bool completedInfo;
  
  final ItemData? item;
  
 
  const EMISelectionScreen({super.key, required this.completedInfo, required this.item  });

  @override
  State<EMISelectionScreen> createState() => _EMISelectionScreenState();
}

class _EMISelectionScreenState extends State<EMISelectionScreen> with SingleTickerProviderStateMixin{
  int selectedPlanIndex = 0;
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
   late AnimationController _controller;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 180),
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
      backgroundColor: const Color.fromARGB(255, 34, 36, 43),
      body:  widget.completedInfo == true ? _displayExpandedInfo() :  _handleProceed() ??  SlideTransition(
            
          position: Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).
          animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
          child: _displayCollapsedInfo())
   );
  }
   _displayCollapsedInfo() {
    final totalItems = widget.item!.items![1].closedState;
    final selectedItem = widget.item!.items![1].openState;
    return totalItems == null ? const Loader() : Column(
        children: [
     GestureDetector(
            onTap: () {
              Provider.of<Counter>(context, listen: false).value--;
              _controller.reverse(from: 1);
              setState(() {
                
              });
              },
             child: Container(
              height: 80,
                width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 37, 44),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  offset: const Offset(4, 4), // Shadow offset (horizontal, vertical)
                  blurRadius: 8, // Blur radius
                  spreadRadius: 2, // Spread radius
                ),]),
                      
                      child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                           Text(
                                    totalItems.body!.key1!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                       const SizedBox(height: 5,),
                                   RichText(text :
                                            TextSpan(text: 
                                                selectedItem!.body!.items![selectedPlanIndex].emi!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                        
                                        ]),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                           Text(
                                    totalItems.body!.key2!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                       const SizedBox(height: 5,),
                                   RichText(text:  TextSpan(text: selectedItem.body!.items![selectedPlanIndex].duration!,
                                          style: const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),
                                         ),),
                        
                                        ]),
                    ),
                    const Padding
                    (
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.grey,))
                  ],
                ),
              ),
           ),
         

      ]);
    
  }
  _displayExpandedInfo()
  {
    final totalItems = widget.item!.items![1].openState;
    return totalItems == null ? const Loader() : Container(
          width: MediaQuery.sizeOf(context).width,
                    
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: BorderRadius.circular(12)),
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                titleText(totalItems.body!.title!),
                  const SizedBox(height: 5),
                  subtitleText(totalItems.body!.subtitle!),
                  const SizedBox(height: 24),
                    
                                 
                  // Plans
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: totalItems.body!.items!.length,
                      itemBuilder: (context, index) {
                        
                        Color ? color ;
                        final plan = totalItems.body!.items![index];
                        if(index == 0)
                          color = const Color.fromARGB(246, 49, 31, 28);
                        else if (index == 1)
                          color = const Color.fromARGB(172, 202, 174, 248);
                        else
                        color = const Color.fromARGB(255, 55, 82, 105);
                        final isSelected = selectedPlanIndex == index;
                        final splitted = plan.emi!.split(' ');
                        return GestureDetector(
                          onTap: () => setState(() => selectedPlanIndex = index),
                          child: Container(
                            width: 130,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              children: [
                              
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    
                                    Container(
                                      margin: const EdgeInsets.only(top : 15),
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
                                        radius: 11,
                                          child: Icon(
                                            isSelected ? Icons.check : null,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                    ),
                                      const Spacer(),
                                      RichText(
                                        
                                        text : TextSpan(text: splitted[0] ,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: '/mo',
                                              style: TextStyle(
                                          color: Color.fromARGB(255, 167, 158, 158),
                                          fontSize: 12,
                                          
                                        ),
                                          )
                                        ]
                                      )
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'for ${plan.duration!}',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        plan.subtitle!,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: 10,
                                          decoration: TextDecoration.underline,
                                          decorationStyle: TextDecorationStyle.dotted,
                                          decorationColor: Colors.indigo
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                   //recommended box in the cards section
                                if(plan.tag == 'recommended')
                                     Positioned(
                          top: 0,
                          left: 24,
                          
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                      
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 212, 212, 212),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'recommended',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                          ],

                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Create Plan Button
                  const SizedBox(height: 24),
                   Container(
                          width: 160,
                          child: OutlinedButton(
                            
                            onPressed: () {},
                            child: Text(
                              totalItems.body!.footer!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11
                              ),
                            ),
                          )),
                  
                  const Spacer(),
                  
                
                ],
              ),
    );
                 
        
  }
}