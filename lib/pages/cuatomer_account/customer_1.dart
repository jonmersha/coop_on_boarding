

import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:onboarding/composed_widjet/dropdown_menu.dart';
import 'package:onboarding/custom_widjet/raised_button.dart';
import 'package:onboarding/custom_widjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/pages/cuatomer_account/customer_2.dart';





class CustomerCreateOne extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<CustomerCreateOne> {




  final firstName=TextEditingController();
  final middleName=TextEditingController();
  final lastName=TextEditingController();

  final title=TextEditingController();
  final maritalStatus=TextEditingController();
  String gender;


  final dob=TextEditingController();
  final mobilePhoneNumber=TextEditingController();
  final officeTelNumber=TextEditingController();
  final emailId=TextEditingController();


  List<Item> genderType = <Item>[
    const Item('Gender',0),
    const Item('MALE',1),
    const Item('FEMALE',2),

  ];
  List<Item> titleType = <Item>[
    const Item('Title',0),
    const Item('MR',1),
    const Item('MISSES',2),

  ];
  List<Item> maritalSt = <Item>[
    const Item('Marital Status',0),
    const Item('SINGLE',1),
    const Item('MARRIED',2),
    const Item('DIVORCED',3),

  ];

  String cutomerTitile;

  String customerMaritalStatus;

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
                  child: UserInputTextField(firstName,'First Name'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(middleName,'Middle Name'),
                ),
                Container(
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(lastName,'Last Name'),
                ),
                Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      MyDropDown(getGeneder,genderType,103),
                      Container(
                          child: MyDropDown(getTitile,titleType,98)),

                    ],
                  ),
                Container(
                    // padding: EdgeInsets.all(5.0),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5.0),
                    child: Column(
                      children: [
                        MyDropDown(getMaritalStatus,maritalSt,146),
                      ],
                    )),

                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(dob,'Birth Date(yyyy-mm-dd)'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(mobilePhoneNumber,'Mobile Number'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(officeTelNumber,'Office Phone'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(dob,'Email'),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomRaisedButton('       Next       ', createAccount),
                    ],
                  ),
                ),

              ],
            )
        )
    );


  }

  void getGeneder(String operation){
    setState(() {
     gender=operation;
    });
  }

  createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateTwo()),
    );
  }

  getTitile(String title) {
    setState(() {
      cutomerTitile=title;
    });
  }
  getMaritalStatus(String maritalStatus) {
    setState(() {
      customerMaritalStatus=maritalStatus;
    });
  }
}







