import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CustomerBankAccount extends StatefulWidget {
  var data;
  CustomerBankAccount(this.data);
  @override
  _CustomerBankAccountState createState() => _CustomerBankAccountState(this.data);
}

class _CustomerBankAccountState extends State<CustomerBankAccount> {

  int productType;
  String currency;
  List<IntegerValue> productTypeList = <IntegerValue>[
    const IntegerValue('Product Type',0),
    const IntegerValue('Saving',6001),


  ];
  List<StringValue> currencyList = <StringValue>[
    const StringValue('Select Currency','ETB'),
    const StringValue('Ethiopian BIrr','ETB'),
    const StringValue('American Dollar','USD'),


  ];
var _data;
  _CustomerBankAccountState(this._data);

  getCurrency(String currency){
    setState(() {
      this.currency=currency;
    });
  }

  getProductType(int productType) {
    setState(() {
      this.productType=productType;
    });
  }


  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {

      });
    }
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding",'Create Bank Account').buildPreferredSize(),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: DropDownStringValue(getCurrency,currencyList,200),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: DropDownIntegerValue(getProductType,productTypeList,203),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(onPressed: ()=>createAccount(), child: Text('Create Account')))
              ],
            )
        )
    );

  }



  createAccount()  async{
    print('Currency:'+currency.toString());

    Methods.showLoaderDialog(context,'Creating Ban Account...');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/onboarding/account/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>
      {
        "customerID": _data['transactionId'],
        "productCode": this.productType.toString(),
        "accountName": _data['firstName']+' '+_data['middleName']+' '+_data['lastName'],
        "shortName": _data['firstName'],
        "currency": this.currency.toString(),
        "messageId": "AC123146"
      }
      ),
    );
    setState(() {
      if(response.statusCode==200){
        Navigator.pop(context);
        var val=convert.jsonDecode(response.body);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: val['status'],
            desc: val['messageBody'],
            btnCancelOnPress:(){} ,
          ).show();

      }
    });
  }



}







