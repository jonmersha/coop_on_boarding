

import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/awidjet/custom_text.dart';
import 'package:onboarding/awidjet/dropdown_menu.dart';
import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/model/Customer.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_2.dart';





class CustomerCreateOne extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<CustomerCreateOne> {




  final firstName=TextEditingController();
  final middleName=TextEditingController();
  final lastName=TextEditingController();

  final title=TextEditingController();
  String gender;


  final dobYear=TextEditingController();
  final dobMonth=TextEditingController();
  final dobDate=TextEditingController();
  final mobilePhoneNumber=TextEditingController();
  final officeTelNumber=TextEditingController();
  final emailId=TextEditingController();

  int yearDOB;


  String cutomerTitile;

  String customerMaritalStatus;


  List<StringValue> genderType = <StringValue>[
    const StringValue('Gender','Gender'),
    const StringValue('MALE','MALE'),
    const StringValue('FEMALE','FEMALE'),

  ];
  List<StringValue> titleType = <StringValue>[
    const StringValue('Title','Title'),
    const StringValue('MR','MR'),
    const StringValue('MISSES','MISSES'),

  ];
  List<StringValue> maritalSt = <StringValue>[
    const StringValue('Marital Status',''),
    const StringValue('SINGLE','SINGLE'),
    const StringValue('MARRIED','MARRIED'),
    const StringValue('DIVORCED','DIVORCED'),

  ];


  //List<int> yearList = generateNumberList(1900,2005);



  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding",'Customer Info 1 of 3').buildPreferredSize(),
        body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("images/onb_back.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
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
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(


                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Expanded(
                            child: DropDownStringValue(getGeneder,genderType,103)),
                        Container(
                          width: 20,
                        ),

                        Expanded(
                            child: DropDownStringValue(getTitile,titleType,98)),

                      ],
                    ),
                ),
                Container(
                    // padding: EdgeInsets.all(5.0),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5.0),
                    child: Column(
                      children: [
                        DropDownStringValue(getMaritalStatus,maritalSt,146),
                      ],
                    )),


                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 30,top: 8,bottom: 8),
                    child: CustomText("Date of Birth", 15, 1.2, Colors.black)),
                Row(
                  children: [
                    Expanded(child: UserInputTextField(dobDate,'Date')),
                    Expanded(child: UserInputTextField(dobMonth,'Month')),
                    Expanded(child: NumberList(getYear,generateNumberList(1920,2005),100)),
                  ],
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
                  child: UserInputTextField(emailId,'Email Id'),
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


  getTitile(String title) {
    setState(() {
      cutomerTitile=title;
    });
  }
  getYear(int year) {
    setState(() {
      this.yearDOB=year;
    });
  }
  getMaritalStatus(String maritalStatus) {
    setState(() {
      customerMaritalStatus=maritalStatus;
    });
  }


  createAccount() {

    //populating the customer data
    BankCustomer customer=new BankCustomer();
    customer.cashierCode=CommonData.userName;
    customer.cashierPassword=CommonData.passWord;
    customer.firstName=firstName.text;
    customer.middleName=middleName.text;
    customer.lastName=lastName.text;
    customer.title=title.text;
    customer.maritalStatus=customerMaritalStatus;
    customer.gender=gender;
    customer.dob=dobYear.text+dobMonth.text+dobDate.text;
    customer.mobilePhoneNumber=mobilePhoneNumber.text;
    customer.officeTelNumber=officeTelNumber.text;
    customer.emailId=emailId.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateTwo(customer)),
    );
  }

  List<int> generateNumberList(start,end){
    List<int> list=<int>[];
    for(int i=start;i<=end;i++){
      list.add(i);
    }
    return list;
  }

}







