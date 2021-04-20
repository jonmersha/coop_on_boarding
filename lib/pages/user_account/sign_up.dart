

import 'package:onboarding/composed_widjet/logo_text.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/custom_widjet/SingnUp.dart';
import 'package:onboarding/custom_widjet/custom_text.dart';
import 'package:onboarding/custom_widjet/raised_button.dart';
import 'package:onboarding/custom_widjet/text_field.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import '../../CommonDate.dart';
import '../landing_page.dart';

class SignUp extends StatefulWidget{
  SignUpState createState()=>SignUpState();

}

class SignUpState extends State<SignUp>{

  bool _isHidden=true;

  final employeeId=TextEditingController();
  final branchCode=TextEditingController();
  final emailId=TextEditingController();
  final mobileNumber=TextEditingController();
  final firstName=TextEditingController();
  final middleName=TextEditingController();
  final lastName=TextEditingController();
  final password=TextEditingController();
  final privilege=TextEditingController();
  final passwordConfirm=TextEditingController();




  String mobileNumberSet;
  //final prefs =  SharedPreferences.getInstance();
  bool _loading = false;
  //Future<String> users;
  LoginScreenState() {
    //_getMobileNumber();
    //this.userName.text=CommonData.mobileNumber;

  }


  _getMobileNumber() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    String mobileNumber=prefs.getString('mobileNumber')??null;
   // this.userName.text=mobileNumber;
    return mobileNumber;
  }

  _saveMobileNumber(String mobileNumber) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setString('mobileNumber', mobileNumber);
  }

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

        body:  Center(

          child: Container(
              padding: EdgeInsets.only(top: 50.0),
              color: CustomColor.cyan_blue,
              child:ListView(

                padding: EdgeInsets.all(5.0),
                children: [
                 // LogoText(),
                 // if(this.userName.text.isEmpty)
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CustomText('Sign App',30.9,1.0,CustomColor.white,),),
                    Container(
                      // padding: EdgeInsets.all(5.0),
                      child: EditTextForSingUp(employeeId,'Your Emplyee Id'),
                    ),
                    Container(
                     // padding: EdgeInsets.all(5.0),
                      child: EditTextForSingUp(branchCode,'Branch Code'),
                    ),
                    Container(
                      // padding: EdgeInsets.all(5.0),
                      child: EditTextForSingUp(firstName,'Please enter first name'),
                    ),
                    Container(
                      // padding: EdgeInsets.all(5.0),
                      child: EditTextForSingUp(middleName,'Please enter middle name'),
                    ),
                  Container(
                    // padding: EdgeInsets.all(5.0),
                    child: EditTextForSingUp(lastName,'Please enter last name'),
                  ),
                  Container(
                    // padding: EdgeInsets.all(5.0),
                    child: CustomEditTextPasswordSignUp(password,'password'),
                  ),
                  Container(
                    // padding: EdgeInsets.all(5.0),
                    child: CustomEditTextPasswordSignUp(passwordConfirm,'confirm password'),
                  ),


                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CustomRaisedButton('Create Account', gotoHomeScreen ),
                        CustomRaisedButton('       Create Account       ', createAccount),
                      ],
                    ),
                  ),

                ],
              )

          ),
        )

    );
  }

  void createAccount() async{

    Methods.showLoaderDialog(context,'SigningUp ......');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/man/create/officer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>
      {
        "employeeId": this.employeeId.text,
        "branchCode": this.branchCode.text,
        "emailId": this.employeeId.text,
        "mobileNumber": this.mobileNumber.text,
        "firstName": this.firstName.text,
        "middleName": this.middleName.text,
        "lastName": this.lastName.text,
        "privilege": "teller",
        "userName": "MMTUSET1",
        "password": this.password.text,
        "corePass": "123123"
      }
      ),
    );
    setState(() {
      if(response.statusCode==200){
        Navigator.pop(context);
        var val=convert.jsonDecode(response.body);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Login Error',
            desc: 'User name or password is not correct',
            btnCancelOnPress:(){} ,
          ).show();



        }
      }
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}




