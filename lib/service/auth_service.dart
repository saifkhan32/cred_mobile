

import 'dart:convert';

import 'package:cred_mobile/constants/error_handling.dart';
import 'package:cred_mobile/constants/utils.dart';
import 'package:cred_mobile/models/items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
    late ItemData item;
    Future<ItemData> getData(BuildContext context)
    async {
      try
      {
   http.Response res = await http.get(Uri.parse('$uri'),
        headers: <String,String>{
                        'Content-Type' : 'application/json; charset=UTF-8'
                    },
                    );
              httpErrorHandling(response: res, context: context, 
              onSuccess: (){
                item = ItemData.fromJson(jsonDecode(res.body));

              });

              

      }
      catch(e)
      {
            showSnackBar(context, e.toString());
      }
      
     return item;

    }
   

}