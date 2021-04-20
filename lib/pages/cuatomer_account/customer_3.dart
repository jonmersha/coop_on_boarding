

import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:onboarding/composed_widjet/dropdown_menu.dart';
import 'package:onboarding/custom_widjet/raised_button.dart';
import 'package:onboarding/custom_widjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class CustomerCreateThree extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<CustomerCreateThree> {




  final idNumber=TextEditingController();
  final documentName=TextEditingController();
  final nameOnDocument=TextEditingController();
  final issueAuthority=TextEditingController();
  final issueDate=TextEditingController();
  final expirationDate=TextEditingController();





  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding",'Basic Info').buildPreferredSize(),
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
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(issueDate,'Data Given'),
                ),
                Container(
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(expirationDate,'Expiration Date'),
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
  }


}







