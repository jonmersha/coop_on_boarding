import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/awidjet/custom_text.dart';
import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:onboarding/model/Customer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../CommonDate.dart';





class CustomerCreateRevsion extends StatefulWidget {
  BankCustomer customer;
  CustomerCreateRevsion( this.customer);

  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState(customer);
}

class _BalanceEnqueryState extends State<CustomerCreateRevsion> {
BankCustomer _customer;
_BalanceEnqueryState(this._customer);

  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding",'Review info').buildPreferredSize(),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                //image: AssetImage("images/onb_back.png"),
                fit: BoxFit.cover,
              ),
            ),

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                CustomTextPair('Title',_customer.title,12, 1.2, Colors.black),
                CustomTextPair('FirstName',_customer.firstName,12, 1.2, Colors.black),
                CustomTextPair('MiddleName',_customer.middleName,12, 1.2, Colors.black),
                CustomTextPair('LastName',_customer.lastName,12, 1.2, Colors.black),

                CustomTextPair('Marital Status',_customer.maritalStatus,12, 1.2, Colors.black),
                CustomTextPair('Gender',_customer.gender,12, 1.2, Colors.black),

                CustomTextPair('MobilePhoneNumber',_customer.mobilePhoneNumber,12, 1.2, Colors.black),
                CustomTextPair('EmailId',_customer.emailId,12, 1.2, Colors.black),

                 CustomTextPair('Message Id',_customer.messageID,12, 1.2, Colors.black),
                 CustomTextPair('mnemonic',_customer.mnemonic,12, 1.2, Colors.black),

                CustomTextPair('city',_customer.city,12, 1.2, Colors.black),

                CustomTextPair('streetName',_customer.streetName,12, 1.2, Colors.black),
                CustomTextPair('poBox',_customer.poBox,12, 1.2, Colors.black),
                CustomTextPair('address',_customer.address,12, 1.2, Colors.black),

                CustomTextPair('country',_customer.countryName,12, 1.2, Colors.black),
                CustomTextPair('sector',_customer.sectorName.toString(),12, 1.2, Colors.black),
                CustomTextPair('industry',_customer.industryName.toString(),12, 1.2, Colors.black),
                CustomTextPair('target',_customer.targetName.toString(),12, 1.2, Colors.black),

                CustomTextPair('idNumber',_customer.idNumber,12, 1.2, Colors.black),
                CustomTextPair('documentName',_customer.documentName,12, 1.2, Colors.black),
                CustomTextPair('nameOnDocument',_customer.nameOnDocument,12, 1.2, Colors.black),
                CustomTextPair('issueAuthority',_customer.issueAuthority,12, 1.2, Colors.black),
                CustomTextPair('issueDate',_customer.issueDate,12, 1.2, Colors.black),
                CustomTextPair('expirationDate',_customer.expirationDate,12, 1.2, Colors.black),

                  Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomRaisedButton('   Register customer    ', createAccount),
                    ],
                  ),
                ),

              ],
            )
        )
    );

  }




void createAccount() async{

  Methods.showLoaderDialog(context,'Customer Create Wait...');
  final http.Response response = await http.post(
    Uri.parse(CommonData.baseUrl+'/onboarding/customer/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:jsonEncode(this._customer.toJson())
  );


  setState(() {
    if(response.statusCode==200){
      Navigator.pop(context);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Success',
        desc: 'Customer Created on Core System',
        btnOkOnPress: (){Navigator.pop(context);},

      ).show();
    }
    else{
      Navigator.pop(context);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: response.statusCode.toString(),
          desc: 'User name or password is not correct',
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

    }
  });
}



}







