import 'package:cred_mobile/constants/bottom_button.dart';
import 'package:cred_mobile/constants/loader.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:cred_mobile/screens/first_screen.dart';
import 'package:cred_mobile/service/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  ItemData? items;
  
  String title = 'Proceed To EMI Selection';
  int _currentSlider = 0;
  @override
  void initState() {
    // TODO: implement initState
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
       backgroundColor: const Color(0xFF1A1B1E),
       
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), 
      child: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: const Color(0xFF1A1A1A)),
        ),
        title:  Padding(
                        padding: EdgeInsets.all(16),
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
              Stack(
              children: [        
      CreditSelector(completedInfo : _currentSlider == 0),
         BottomButton(
            onTap : (){
              setState(() {
                _currentSlider++;
              });
             
            }, title: title,
          ),

    ])
  );
  }
}