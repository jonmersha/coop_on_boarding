import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/awidjet/custom_text.dart';
import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/model/Customer.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_2.dart';

class CustomerCreateOne extends StatefulWidget {
  @override
  _BalanceEnquiryState createState() => _BalanceEnquiryState();
}

class _BalanceEnquiryState extends State<CustomerCreateOne> {
  final firstName=TextEditingController();
  final middleName=TextEditingController();
  final lastName=TextEditingController();

  String gender;

  final mobilePhoneNumber=TextEditingController();
  final officeTelNumber=TextEditingController();
  final emailId=TextEditingController();

  int yearDOB;
  String monthDOB;
  String dateDOB;
  String customerTitle;
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

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.only(top: 20),
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                             DropDownStringValue(getTitle,titleType,30),
                      Expanded(
                        child: UserInputTextField(firstName,'First Name'),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(middleName,'Middle Name'),
                ),
                Container(

                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(lastName,'Last Name'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropDownStringValue(getGender,genderType,50),
                        DropDownStringValue(getMaritalStatus,maritalSt,90),
                      ],
                    ),
                ),

                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 30,top: 8,bottom: 8),
                    child: CustomText("Date of Birth", 20, 1.2, Colors.black)),
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
                            NumberList(getYear,generateNumberList(1920,2005),'Year',50)
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(child: UserInputTextField(mobilePhoneNumber,'Mobile Number')),
                      Expanded(child:UserInputTextField(officeTelNumber,'Office Phone'))
                    ],
                  ),
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

  void getGender(String operation){
    setState(() {
     gender=operation;
    });
  }
  getTitle(String title) {
    setState(() {
      customerTitle=title;
    });
  }

  getYear(int year) {
    setState(() {
      this.yearDOB=year;
    });
  }
  getMonth(int val) {
    setState(() {
      this.monthDOB=(val>9?val.toString():'0'+val.toString());
    });
  }
  getDate(int val) {
    setState(() {
      this.dateDOB=(val>9?val.toString():'0'+val.toString());
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
    customer.title=customerTitle;
    customer.maritalStatus=customerMaritalStatus;
    customer.gender=gender;



    //customer.dob= this.yearDOB.toString() +'-'+this.monthDOB+'-'+this.dateDOB;
    customer.dob= this.yearDOB.toString() +this.monthDOB+this.dateDOB;

    //print(customer.title+' '+customer.dob);
    //customer.dob= this.yearDOB.toString() +this.monthDOB.toString()+this.dateDOB.toString();
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







