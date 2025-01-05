
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/constants/utils.dart';
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

    int selectedPlanIndex = 0;



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
                    height: 400,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272B34),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         titleText(totalItems.body!.title!),
                          const SizedBox(height: 3,),
                      subtitleText(totalItems.body!.subtitle!),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: totalItems.body!.items!.length,
                            itemBuilder: (context,index)
                            {
                            final plan = totalItems.body!.items![index];
                            final isSelected = selectedPlanIndex == index;
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedPlanIndex = index;
                                });
                              },
                              child: Row(
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
                                  CircleAvatar(
                                        backgroundColor: const Color.fromARGB(255, 161, 161, 161),
                                        radius: 11,
                                          child: Icon(
                                            isSelected ? Icons.check : null,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                         
                                ],
                              ),
                            );
                                          }),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
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
