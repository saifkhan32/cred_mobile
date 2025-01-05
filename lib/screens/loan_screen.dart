
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:flutter/material.dart';


class LoanScreen extends StatefulWidget {
  final bool completedInfo;
  
  final ItemData? item;

  const LoanScreen({super.key, required this.completedInfo, required this.item});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {

  // Sample data for collapsible sections
  final List<int> creditOptions = [50000, 100000, 150000, 200000];
  final List<int> emiOptions = [4247, 5000, 6000, 7000];
  final List<int> durationOptions = [6, 12, 18, 24];



  @override
  Widget build(BuildContext context) {
    final totalItems = widget.item!.items![2].openState;
    
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 34, 36, 43),
      body: 
      
              // Credit Amount Section with Collapsible
              widget.completedInfo ?
              totalItems == null ? const Loader()
                   : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // Bank Account Section
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 445,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                      totalItems.body!.title!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 103, 146, 158),
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    const SizedBox(height: 3,),
                       Text(
                      totalItems.body!.subtitle!,
                      style: TextStyle(
                          color: Colors.grey[400],
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: totalItems.body!.items!.length,
                            itemBuilder: (context,index)
                            {
                                final plan = totalItems.body!.items![index];
                            
                            return Row(
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
                                      children: [
                                        Text(
                                          plan.title!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        Text(
                                          plan.subtitle!,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 10,)
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.circle,
                                  color: Color.fromARGB(255, 82, 81, 81),
                                ),
                              ],
                            );
                                          }),
                        ),
                        const SizedBox(height: 21),
                        Container(
                          width: 130,
                          child: OutlinedButton(
                            
                            onPressed: () {},
                            child: Text(
                              totalItems.body!.footer!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ) : const SizedBox(),
        
        
       
    );
  }
}
