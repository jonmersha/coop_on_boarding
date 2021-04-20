



import 'dart:convert';

import 'dart:convert' as convert;



import 'package:onboarding/custom_widjet/SingnUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AccountCreationResult extends StatefulWidget{
  AccountCreationResultState createState()=>AccountCreationResultState();

}
class AccountCreationResultState extends State<AccountCreationResult>{
  final   password=TextEditingController();
  final   userName=TextEditingController();

  String gotoHomeScreen(){
    setState(() {
      //Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>new SignUpScreen()),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

            child: Text('Account Created Successfully'),

        ),
      ),
    );
  }
  void confirmEmail() async{
    final http.Response response = await http.post(
      Uri.parse('https://hullupay.herokuapp.com/customer/language'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>
      {
        "customerMobile": "0911643491"
      }
      ),
    );
    setState(() {
      if(response.statusCode==200){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>new LandingPage()));
        var val=convert.jsonDecode(response.body);
        userName.text=val['status'];
      }
    });
  }
}
