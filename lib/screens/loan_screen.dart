import 'package:flutter/material.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  bool isCreditExpanded = false;
  bool isEMIExpanded = false;
  bool isDurationExpanded = false;

  // Sample data for collapsible sections
  final List<int> creditOptions = [50000, 100000, 150000, 200000];
  final List<int> emiOptions = [4247, 5000, 6000, 7000];
  final List<int> durationOptions = [6, 12, 18, 24];

  int selectedCredit = 150000;
  int selectedEMI = 4247;
  int selectedDuration = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B1E),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar with close and help buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.help_outline, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Credit Amount Section with Collapsible
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'credit amount',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCreditExpanded = !isCreditExpanded;
                            if (isCreditExpanded) {
                              isEMIExpanded = false;
                              isDurationExpanded = false;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              '₹${selectedCredit.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              isCreditExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      if (isCreditExpanded)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF272B34),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: creditOptions.map((amount) => 
                              ListTile(
                                title: Text(
                                  '₹${amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                selected: selectedCredit == amount,
                                onTap: () {
                                  setState(() {
                                    selectedCredit = amount;
                                    isCreditExpanded = false;
                                  });
                                },
                              ),
                            ).toList(),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // EMI and Duration Row
                  Row(
                    children: [
                      // EMI Section with Collapsible
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'EMI',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isEMIExpanded = !isEMIExpanded;
                                  if (isEMIExpanded) {
                                    isCreditExpanded = false;
                                    isDurationExpanded = false;
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '₹$selectedEMI /mo',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    isEMIExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            if (isEMIExpanded)
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF272B34),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: emiOptions.map((emi) => 
                                    ListTile(
                                      title: Text(
                                        '₹$emi /mo',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      selected: selectedEMI == emi,
                                      onTap: () {
                                        setState(() {
                                          selectedEMI = emi;
                                          isEMIExpanded = false;
                                        });
                                      },
                                    ),
                                  ).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),
                      // Duration Section with Collapsible
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'duration',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isDurationExpanded = !isDurationExpanded;
                                  if (isDurationExpanded) {
                                    isCreditExpanded = false;
                                    isEMIExpanded = false;
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '$selectedDuration months',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    isDurationExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            if (isDurationExpanded)
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF272B34),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: durationOptions.map((duration) => 
                                    ListTile(
                                      title: Text(
                                        '$duration months',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      selected: selectedDuration == duration,
                                      onTap: () {
                                        setState(() {
                                          selectedDuration = duration;
                                          isDurationExpanded = false;
                                        });
                                      },
                                    ),
                                  ).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  
                  // Bank Account Section
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'where should we send the money?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'amount will be credited to this bank account. EMI will also be debited from this bank account',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    'https://static-asset.inc42.com/hdfc-bank.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'HDFC Bank',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '50100117009192',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 21),
                        OutlinedButton(
                          
                          onPressed: () {},
                          child: const Text(
                            'Change account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom KYC Button
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: (){},
                child: ClipRRect(
                   
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFF3949AB),
                    child: const Text(
                      'Tap for 1-click KYC',
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
            ),
          ],
        ),
      ),
    );
  }
}
