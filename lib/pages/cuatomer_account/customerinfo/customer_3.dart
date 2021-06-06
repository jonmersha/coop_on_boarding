


import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/awidjet/custom_text.dart';

import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/model/Customer.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_review.dart';


class CustomerCreateThree extends StatefulWidget {
  BankCustomer customer;
  CustomerCreateThree( this.customer);

  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState(customer);
}

class _BalanceEnqueryState extends State<CustomerCreateThree> {
BankCustomer customer;
_BalanceEnqueryState(this.customer);

  final idNumber=TextEditingController();
  final documentName=TextEditingController();
  final nameOnDocument=TextEditingController();
  final issueAuthority=TextEditingController();

  final issueDate=TextEditingController();
  final issueYear=TextEditingController();
  final issueMonth=TextEditingController();

final expirationDate=TextEditingController();
final expirationYear=TextEditingController();
final expirationMonth=TextEditingController();

int yearGDDOB;
String monthGDDOB;
String dateDGDOB;


int yearEXDOB;
String monthEXDOB;
String dateEXDOB;



getYear(int year) {
  setState(() {
    this.yearGDDOB=year;
  });
}
getMonth(int val) {
  setState(() {
    this.monthGDDOB=(val>9?val.toString():'0'+val.toString());
  });
}
getDate(int val) {
  setState(() {
    this.dateDGDOB=(val>9?val.toString():'0'+val.toString());
  });
}


getExYear(int year) {
  setState(() {
    this.yearEXDOB=year;
  });
}
getExMonth(int val) {
  setState(() {
    this.monthEXDOB=(val>9?val.toString():'0'+val.toString());
  });
}
getExDate(int val) {
  setState(() {
    this.dateEXDOB=(val>9?val.toString():'0'+val.toString());
  });
}

  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {


      });
    }
    this.customer.mnemonic='';
    this.customer.messageID='';
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer Info",'3 of 3').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                   padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(idNumber,'Identification Number'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(documentName,'Document Name'),
                ),

                Container(
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(nameOnDocument,'Name On Document'),
                ),

                Container(
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(issueAuthority,'Issuing Authority'),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 30,top: 8,bottom: 8),
                    child: CustomText("Issue Date", 15, 1.2, Colors.black)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1.0, color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberList(getDate,generateNumberList(1,31),'Date',50),
                        Text('/'),
                        NumberList(getMonth,generateNumberList(1,12),'Month',50),
                        Text('/'),
                        NumberList(getYear,generateNumberList(2015,2021),'Year',50)
                      ],
                    ),
                  ),
                ),

                Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 30,top: 8,bottom: 8),

            child: CustomText("Expiration Date", 15, 1.2, Colors.black)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1.0, color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberList(getExDate,generateNumberList(1,31),'Date',50),
                        Text('/'),
                        NumberList(getExMonth,generateNumberList(1,12),'Month',50),
                        Text('/'),
                        NumberList(getExYear,generateNumberList(2021,2030),'Year',50)
                      ],
                    ),
                  ),
                ),

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

List<int> generateNumberList(start,end){
  List<int> list=<int>[];
  for(int i=start;i<=end;i++){
    list.add(i);
  }
  return list;
}

  createAccount() {
    this.customer.idNumber=idNumber.text;
    this.customer.documentName=documentName.text;
    this.customer.nameOnDocument=nameOnDocument.text;
    this.customer.issueAuthority=issueAuthority.text;

    this.customer.issueDate= yearGDDOB.toString()+'-'+monthGDDOB.toString()+'-'+dateDGDOB.toString();
    this.customer.expirationDate=yearEXDOB.toString()+'-'+monthEXDOB.toString()+'-'+dateEXDOB.toString();
print(this.customer.toJson());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateRevsion(this.customer)),
    );
  }


}







