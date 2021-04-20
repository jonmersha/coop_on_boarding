

import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:onboarding/composed_widjet/dropdown_menu.dart';
import 'package:onboarding/custom_widjet/raised_button.dart';
import 'package:onboarding/custom_widjet/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/pages/cuatomer_account/customer_3.dart';





class CustomerCreateTwo extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<CustomerCreateTwo> {




  final streetName=TextEditingController();
  final poBox=TextEditingController();
  final address=TextEditingController();

  int sector;
  int industry;
  int target;
  String country;





  List<Item> countrys = <Item>[
    const Item('Country',0),
    const Item('ET',0),
    const Item('SOM',0),
    const Item('USA',0),
    const Item('GB',0),
    const Item('CH',0),

  ];
  List<Item> targets = <Item>[
    const Item('Target',0),
    const Item('Saving',0),
    const Item('Current',0),



  ];
  List<Item> industries = <Item>[
    const Item('Industry',0),
    const Item('Agri',0),



  ];
  List<Item> sectors = <Item>[
    const Item('Sector',0),
    const Item('Agri',0),
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(5.0),
                      child: MyDropDown(sectorSettor,sectors,103),
                    ),
                    Container(
                      // alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(5.0),
                      child: MyDropDown(industrySettor,industries,103),
                    ),


                    Container(
                     // alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(5.0),
                      child:  MyDropDown(countrySet,countrys,103),
                    ),

                  ],
                ),

                    Container(
                      // alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(5.0),
                      child: MyDropDown(targetSet,countrys,103),
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

  void targetSet(int target){
    setState(() {
     this.target=target;
    });
  }
  void countrySet(String code){
    setState(() {
     this.country=code;
    });
  }
  industrySettor(int industry) {
    setState(() {
      this.industry=industry;
    });
  }
  sectorSettor(int sector) {
    setState(() {
      this.sector=sector;
    });
  }

  createAccount() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateThree()),
    );

  }

}







