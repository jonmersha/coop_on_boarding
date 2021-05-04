import 'dart:convert';

import 'dart:convert' as convert;

import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/sing_text_field.dart';
import 'package:onboarding/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../CommonDate.dart';

class SignUpScreen extends StatefulWidget{
  SignUpScreenState createState()=>SignUpScreenState();

}

class SignUpScreenState extends State<SignUpScreen>{


  final   email=TextEditingController();
  final   mobileNumber=TextEditingController();
  final   firstName=TextEditingController();
  final   middleName=TextEditingController();
  final   lastName=TextEditingController();
  final   motherFullName=TextEditingController();
  final   nationality=TextEditingController();
  final   maritalStatus=TextEditingController();
  final   gender=TextEditingController();
  final   dateOfBirth=TextEditingController();
  final   confirmPassword=TextEditingController();
  final   password=TextEditingController();



  void login() async{
    setState(() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>new LandingPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

            padding: EdgeInsets.only(top: 5.0),
            color: Colors.white,
            child:ListView(
              padding: EdgeInsets.all(30.0),
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    //child: Text('Mobile Number or Email Id' , style: TextStyle(fontSize: 20.0),)
                ),
                MyTextField(email,'Please Inter your Mobile/email'),
                MyTextField(mobileNumber,'Please Inter your mobile number'),
                MyTextField(firstName,'Please Inter your first Name'),
                MyTextField(middleName,'Please Inter your middle Name'),
                MyTextField(lastName,'Please Inter your last Name'),
                MyTextField(motherFullName,' Please Inter your Mother Name'),

                MyTextField(nationality,'nationality'),
                MyTextField(maritalStatus,'Marital Status'),


                MyTextField(gender,' gender'),
                MyTextField(dateOfBirth,'Date Of birth'),




                MyTextField(password,'password'),
                MyTextField(confirmPassword,'confirm Password'),



                //RaisedButton(onPressed: login)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRaisedButton('Create Account', ceareAcount),
                    ],
                  ),
                ),
                FlatButton(onPressed: login, child: Text('back to login '))
              ],
            )

        ),
      ),
    );
  }



  ceareAcount() async {

    //vaidation should be done
   String baseUrl= CommonData.baseUrl;

   String endPoint='/customer/add';
   final http.Response response = await http.post(Uri.parse(baseUrl+endPoint) ,
     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },
     body: jsonEncode(<String, String>
     {

       "mobileNumber": mobileNumber.text,
       "email": email.text,
       "firstName": firstName.text,
       "middleName": middleName.text,
       "lastName": lastName.text,
       "maritalStatus": maritalStatus.text,
       "gender": gender.text,
       "nationality": nationality.text,
       "birthDate": dateOfBirth.text,
       "password": password.text,
       "confirmPassword": confirmPassword.text
     }
     ),
   );
   setState(() {
     if(response.statusCode==200){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>new LandingPage()));
       var val=convert.jsonDecode(response.body);
     }
   });

  }
}
