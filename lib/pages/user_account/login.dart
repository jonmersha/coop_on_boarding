import 'package:onboarding/awidjet/logo_text.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/awidjet/SingnUp.dart';
import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/text_field.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:onboarding/pages/user_account/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import '../../CommonDate.dart';
import '../landing_page.dart';

class LoginScreen extends StatefulWidget{
  LoginScreenState createState()=>LoginScreenState();

}

class LoginScreenState extends State<LoginScreen>{
  //Future<SharedPreferences> _prefs = await SharedPreferences.getInstance();
    final   password=TextEditingController();
    final    userName=TextEditingController();
    String mobileNumberSet;
    //final prefs =  SharedPreferences.getInstance();
    bool _loading = false;
    //Future<String> users;
  LoginScreenState() {
    //_getMobileNumber();
    this.userName.text=CommonData.userName;
    this.password.text='123joni';

  }
    _getMobileNumber() async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      String mobileNumber=prefs.getString('userName')??null;
      this.userName.text=mobileNumber;
      return mobileNumber;
    }

  _saveMobileNumber(String userName) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
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
      backgroundColor: CustomColor.cyan_blue,
      body:  Center(

        child: Container(
            padding: EdgeInsets.only(top: 90.0),
            color: CustomColor.cyan_blue,
            child:ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                LogoText(),
                if(this.userName.text.isEmpty)
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: EditTextForSingUp(userName,'Please enter Mobile/emil Id'),
                  ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: CustomEditTextPassword(password,'Please enter Your Password'),

                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CustomRaisedButton('Create Account', gotoHomeScreen ),
                      CustomRaisedButton('  sign up  ', createUser),
                      CustomRaisedButton('       login       ', login),
                    ],
                  ),
                ),
                FlatButton(onPressed: login,
                  child:
                  Text('Forget Your Password?', style: TextStyle(fontSize: 20,color: Colors.white),)
                  ,
                ),
              ],
            )

        ),
      )

    );
  }
    createUser(){
      setState(() {
        //Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>new SignUp()),
        );
      });
    }


  void login() async{

    Methods.showLoaderDialog(context,'Login Wait...');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/officer/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>
      {
        "userName": this.userName.text,
        "password": '123joni'
      }
      ),
    );
    setState(() {
      if(response.statusCode==200){
        Navigator.pop(context);
        var val=convert.jsonDecode(response.body);
        if(val['userName']==userName.text){
          _saveMobileNumber(val['userName']);
          CommonData.userData=UserData(val);
          CommonData.passWord=password.text;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>new LandingPage()));
        }
        else{
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
    });
  }




}
