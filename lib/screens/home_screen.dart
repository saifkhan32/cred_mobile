import 'package:cred_mobile/constants/bottom_button.dart';
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:cred_mobile/provider/provider.dart';
import 'package:cred_mobile/screens/emi_screen.dart';
import 'package:cred_mobile/screens/first_screen.dart';
import 'package:cred_mobile/screens/loan_screen.dart';
import 'package:cred_mobile/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  ItemData? items;
  
 

  @override
  void initState() {
  
    super.initState();
    getData();
    
  }
  getData()
  async {
     items = await authService.getData(context);
      setState(() {
        
      });
  }
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 61, 61, 61),
       //Bar with two icons 

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 32, 36, 46)),
        ),
        title:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           CircleAvatar(
                                  backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                                  radius: 10,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.close,size: 13,),
                                    color: const Color.fromARGB(255, 226, 226, 226),
                                    onPressed: () {},
                                  ),
                                ),
                          CircleAvatar(
                                  backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                                  radius: 10,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.question_mark,size: 13,),
                                    color: const Color.fromARGB(255, 216, 214, 214),
                                    onPressed: () {},
                                  ),
                                ),
                        ],
                                            ),
                                        ),
                      ),
      ),),
        body:  items == null ? const Center(child: Loader()) : 
              Consumer<MyModel>(
                builder: (context, model, child) {

                  return Stack(
                children: [        
                      CreditSelector(completedInfo : model.value == 0,item : items),
                      if(model.value == 1 || model.value == 2)
                      Positioned(
                            top: 75,
                            left: 0,
                            right: 0,
                            bottom: 0,
                        child: EMISelectionScreen(completedInfo: model.value==1,item : items,)) ,
                        if(model.value==2)
                      Positioned(
                            top: 155,
                            left: 0,
                            right: 0,
                            bottom: 0,
                        child: LoanScreen(completedInfo: model.value==2,item : items)) ,
                         BottomButton(
                            onTap : (){
                               if(model.value<=1) {
                    model.value++;
                  }
                setState(() {
                 
                  
                });
                
                             
                            }, title: items!.items![model.value].ctaText!,
                          ),
                
                    ]);}
              )
  );
  }
}