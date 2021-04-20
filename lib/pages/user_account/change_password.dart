import 'dart:convert';
import 'dart:convert' as convert;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/custom_widjet/raised_button.dart';
import 'package:onboarding/custom_widjet/text_field.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../CommonDate.dart';


class ChangePass extends StatefulWidget {
  @override
  _changePasstate createState() => _changePasstate();
}

class _changePasstate extends State<ChangePass> {
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final conformPassword = TextEditingController();
  // final comment = TextEditingController();
  // final receiverFullName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    String setOperationType(int type) {
      setState(() {
        //operationType = type;
      });
    }


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SmallerBar("Wallet to Wallet").buildPreferredSize(),
      body: Container(
          padding: EdgeInsets.only(top: 1.0),
          color: CustomColor.cyan_blue,
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              Container(
                padding: EdgeInsets.only(top:5.0),
                child: CustomEditTextPassword(oldPassword, 'old password'),
              ),
            //  Center(child: Text(receiverFullName.text)),
              Container(
                padding: EdgeInsets.only(top:5.0),
                child: UserInputTextField(newPassword, 'new password'),
              ),
              Container(
                padding: EdgeInsets.only(top:5.0),
                child: CustomEditText(conformPassword, 'confirm password'),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomRaisedButton('change password', changePassword),
                  ],
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }

  void changePassword() async {
    if(newPassword.text!=conformPassword.text){

      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'password not confirmed',
        btnCancelOnPress: () {},
      ).show();
      return null;
    }
    else if(newPassword.text.length<8){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'password length must not less than 8 ',
        btnCancelOnPress: () {},
      ).show();
      return null;
    }
    Methods.showLoaderDialog(context, 'changing password');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl + '/customer/pass_ch'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>
      {
        "phoneNumber": CommonData.mobileNumber,
        "oldPass": oldPassword.text,
        "newPass": newPassword.text,
        "newPassConfirm": conformPassword.text
      }
      ),

    );
    setState(() {
      if (response.statusCode == 200) {
        Navigator.pop(context);
        var val = convert.jsonDecode(response.body);
        if (val['status'] == 'Success') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: val['status'],
            desc: val['massageBody'],
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          ).show();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: val['status'],
            desc: val['massageBody'],
            btnCancelOnPress: () {

            },
          ).show();
        }
      }
    else{
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Connection',
          desc: 'Network Connectivity Problem',
          btnCancelOnPress: () {

          },
        ).show();

      }
    });


  }



  // void checkRecever() async {
  //   Methods.showLoaderDialog(context, 'Sending Money');
  //   final http.Response response = await http.post(
  //     CommonData.baseUrl + '/customer_info',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "accountCode": receiverNumber.text
  //     }
  //     ),
  //   );
  //   setState(() {
  //     if (response.statusCode == 200) {
  //       Navigator.pop(context);
  //       var val = convert.jsonDecode(response.body);
  //       if (val['accountCode'] == receiverNumber.text) {
  //         receiverFullName.text=val['fullName'];
  //            } else {
  //         receiverFullName.text='This Receiver is not found!';
  //       }
  //     }});



  //}
}
