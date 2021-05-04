

import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/awidjet/dropdown_menu.dart';
import 'package:onboarding/awidjet/raised_button.dart';
import 'package:onboarding/awidjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/model/Customer.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_3.dart';





class CustomerCreateTwo extends StatefulWidget {
  BankCustomer customer;
  CustomerCreateTwo(this.customer);

  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState(customer);
}

class _BalanceEnqueryState extends State<CustomerCreateTwo> {


  BankCustomer _customer;
  _BalanceEnqueryState(this._customer);

  final streetName=TextEditingController();
  final poBox=TextEditingController();
  final address=TextEditingController();

  int sector;
  int industry;
  int target;
  String country;


  List<Item> countrys = <Item>[
    const Item('Country',0),
    const Item('ET',1),
    const Item('SOM',2),
    const Item('USA',3),
    const Item('GB',4),
    const Item('CH',5),

  ];
  List<Item> targets = <Item>[
    const Item('Target',0),
    const Item('Saving',20),
    const Item('Current',21),



  ];
  List<Item> industries = <Item>[
    const Item('Industry',0),
    const Item('Agri',1000),



  ];
  List<Item> sectors = <Item>[
    const Item('Sector',0),
    const Item('Agriculture',1),
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
        appBar: APPBarChieledPage("Customer Info",'2 of 3').buildPreferredSize(),
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
                  child: UserInputTextField(streetName,'Street Name'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(poBox,'PO Box'),
                ),
                Container(
                 // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(address,'Address'),
                ),
                Container(
                  // alignment: Alignment.topLeft,
                   padding: EdgeInsets.all(15.0),
                  child: MyDropDownNumeric(sectorSetter,sectors,103),
                ),

                Container(
                  padding: EdgeInsets.all(15.0),
                  child: MyDropDownNumeric(industrySetter,industries,103),
                ),


                Container(

                  padding: EdgeInsets.all(15.0),
                  child:  MyDropDown(countrySet,countrys,110),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: MyDropDownNumeric(targetSet,targets,103),
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

  targetSet(int target){
    setState(() {
     this.target=target;
    });
  }
  countrySet(String code){
    setState(() {
     this.country=code;
    });
  }
  industrySetter(int industry) {
    setState(() {
      this.industry=industry;
    });
  }
  sectorSetter(int sector) {
    setState(() {
      this.sector=sector;
    });
  }





  createAccount() {

this._customer.streetName=streetName.text;
this._customer.poBox=poBox.text;
this._customer.address=address.text;
this._customer.sector=sector;
this._customer.industry=industry;
this._customer.target=target;
this._customer.country=country;
this._customer.city=address.text;



    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateThree(this._customer)),
    );

  }

}







