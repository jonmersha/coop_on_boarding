


import 'package:onboarding/awidjet/DateInput.dart';
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/onb_back.png"),
                fit: BoxFit.cover,
              ),
            ),

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
                    child: CustomText("Isseu Date", 15, 1.2, Colors.white)),
           Row(
             children: [
               Expanded(child: UserInputTextField(issueYear,'Year')),
               Expanded(child: UserInputTextField(issueMonth,'Month')),
               Expanded(child: UserInputTextField(issueDate,'Date')),
             ],
           ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 30,top: 8,bottom: 8),

            child: CustomText("Expiration Date", 15, 1.2, Colors.white)),
           Row(
             children: [
               Expanded(child: UserInputTextField(expirationYear,'Year')),
               Expanded(child: UserInputTextField(expirationMonth,'Month')),
               Expanded(child: UserInputTextField(expirationDate,'Date')),
             ],
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

  createAccount() {
    this.customer.idNumber=idNumber.text;
    this.customer.documentName=documentName.text;
    this.customer.nameOnDocument=nameOnDocument.text;
    this.customer.issueAuthority=issueAuthority.text;

    this.customer.issueDate= issueYear.text+'-'+ issueMonth.text+'-'+issueDate.text;
    this.customer.expirationDate=expirationYear.text+'-'+ expirationMonth.text+'-'+expirationDate.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateRevsion(this.customer)),
    );
  }


}







