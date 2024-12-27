import 'package:flutter/material.dart';

class EMISelectionScreen extends StatefulWidget {
  const EMISelectionScreen({Key? key}) : super(key: key);

  @override
  State<EMISelectionScreen> createState() => _EMISelectionScreenState();
}

class _EMISelectionScreenState extends State<EMISelectionScreen> {
  int selectedPlanIndex = 0;

  final List<Map<String, dynamic>> plans = [
    {
      'amount': 4247,
      'duration': 12,
      'recommended': false,
    },
    {
      'amount': 5580,
      'duration': 9,
      'recommended': true,
    },
    {
      'amount': 7890,
      'duration': 6,
      'recommended': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Stack(
          children:[ Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.close, color: Colors.white60),
                    Icon(Icons.question_mark, color: Colors.white60),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Credit Amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'credit amount',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹1,50,000',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white60,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Repayment Title
                Text(
                  'how do you wish to repay?',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'choose one of our recommended plans or make your own',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                  
                               
                // Plans
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: plans.length,
                    itemBuilder: (context, index) {
                      
                      Color ? color ;
                      final plan = plans[index];
                      if(index == 0)
                        color = const Color.fromARGB(255, 114, 80, 67);
                      else if (index == 1)
                        color = Colors.indigo;
                      else
                      color = const Color.fromARGB(255, 35, 74, 105);
                      final isSelected = selectedPlanIndex == index;
                      
                      return GestureDetector(
                        onTap: () => setState(() => selectedPlanIndex = index),
                        child: Container(
                          width: 140,
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
                                  
                                  CircleAvatar(
                                    backgroundColor: const Color.fromARGB(255, 88, 88, 88),
                                    radius: 11,
                                      child: Icon(
                                        isSelected ? Icons.check : null,
                                        color: Colors.white,
                                        size: 16,
                                      )),
                                    const Spacer(),
                                    Text(
                                      '₹${plan['amount']}/mo',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'for ${plan['duration']} months',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'See calculations',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        decorationStyle: TextDecorationStyle.dotted,
                                        decorationColor: Colors.indigo
                                      ),
                                    ),
                                  ],
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
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                    
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    
                    child: Text(
                      'Create your own plan',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
                
                const Spacer(),
                
              
              ],
            ),
          ),
                        Positioned(
                          top: 240,
                          left: 202,
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
          // Bottom Button
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3949AB),
                      minimumSize: const Size(double.infinity, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                        topRight: Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Select your bank account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}