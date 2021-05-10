import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';
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
  Widget v;


  List<StringValue> countrys = <StringValue>[
    const StringValue('Please Select country',''),
    const StringValue('Ethiopia','ET'),
    const StringValue('Kenya','KE'),
    const StringValue('South Sudan','SD'),


  ];



  List<IntegerValue> targets = <IntegerValue>[
    const IntegerValue('Target',0),
    const IntegerValue('Saving',20),
    const IntegerValue('Current',21),
  ];




  List<IntegerValue> industries = <IntegerValue>[
    const IntegerValue('Please Select Industry',0),
     const IntegerValue('First Select Sector',20000),

  ];
  List<IntegerValue> sectors = <IntegerValue>[
    const IntegerValue('Please Select Sector',0),
    const IntegerValue('Agriculture',1000),
    const IntegerValue('Manufacturing',1200),
    const IntegerValue('Individual',1300),
    const IntegerValue('Public Sector',1400),
    const IntegerValue('Domestic Trade & Service',1500),
    const IntegerValue('Cooperatives',1600),
    const IntegerValue('Associations',1700),
    const IntegerValue('Corporate',1800),
    const IntegerValue('Building and Construction',2000),
    const IntegerValue('International Trade',2500),
    const IntegerValue('Financial Sector',3000),
    const IntegerValue('Consumer',3500),
    const IntegerValue('Not for Profit Organizations',4500),
    const IntegerValue('International Organizations',5000),
    const IntegerValue('Government Organizations',5500),

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
               // image: AssetImage("images/onb_back.png"),
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
                  child: UserInputTextField(poBox,'PoBox'),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(address,'Address'),
                ),
                Container(
                   padding: EdgeInsets.all(15.0),
                  child: DropDownIntegerValue(sectorSetter,sectors,103),
                ),

                Container(
                  padding: EdgeInsets.all(15.0),
                  child: v,//MyDropDownNumeric(industrySetter,industries,103),
                ),


                Container(

                  padding: EdgeInsets.all(15.0),
                  child:  DropDownStringValue(countrySet,countrys,110),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: DropDownIntegerValue(targetSet,targets,103),
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
      print(sector);

      if(sector==1000){
        this.industries=<IntegerValue>[
          const IntegerValue('Please Select industry',0),
          const IntegerValue('Cereals Production',1001),
          const IntegerValue('Agricultural Machineries',1002),
          const IntegerValue('Fertilizer & Chemicals Supply',1003),
          const IntegerValue('Selected Seed Supply',1004),
          const IntegerValue('Pulses and Oil seeds Crops Pruction',1005),
          const IntegerValue('Vegetables and Fruits Production',1006),
          const IntegerValue('Animal Husbandry',1007),
          const IntegerValue('Cattle Fattening',1008),
          const IntegerValue('Honey & Beeswax Production',1009),
          const IntegerValue('Horticulture',1010),
          const IntegerValue('Dairy Production',1011),
          const IntegerValue('Sugarcane',1012),
          const IntegerValue('Cotton Production',1013),
          const IntegerValue('Sisal Production',1014),
          const IntegerValue('Coffee Production',1015),
          const IntegerValue('Chat Production',1016),
          const IntegerValue('Tea Production',1017),
          const IntegerValue('Tobaco',1018),
          const IntegerValue('Rubber',1019),
          const IntegerValue('Paultry',1020),
          const IntegerValue('Fishing',1021),
          const IntegerValue('Pulses production',1022),

        ];

      }
      if(sector==1200){
        this.industries=<IntegerValue>[
          const IntegerValue('Furniture and Fixture',1201),
          const IntegerValue('Alcohol & Beverages',1202),
          const IntegerValue('Flour Maca Spagety and Bisc',1203),
          const IntegerValue('Edible Oil',1204),
          const IntegerValue('Honey and Beeswax Processing',1205),
          const IntegerValue('Slaughtering House and Meat Proc',1206),
          const IntegerValue('Dairy Processing',1207),
          const IntegerValue('Textile and Garment',1208),
          const IntegerValue('Pharmace Medical Supply and Equt',1209),
          const IntegerValue('Assembl of Motor Vehic Trailers etc',1210),
          const IntegerValue('Mining and Quarrying',1211),
          const IntegerValue('Soap and Detergent',1212),
          const IntegerValue('Cosmetics and Perfumes',1213),
          const IntegerValue('Glass and Glass Products',1214),
          const IntegerValue('Printing Services',1215),
          const IntegerValue('Tannery',1216),
          const IntegerValue('Chemicals',1217),
          const IntegerValue('Electronics',1218),
          const IntegerValue('Steel Products Manufacturing',1219),
          const IntegerValue('Sugar Production',1220),
          const IntegerValue('Cement Production',1221),
          const IntegerValue('Coffee rosting',1222),
          const IntegerValue('Crown Cork',1223),


        ];

      }
      if(sector==1300){
        this.industries=<IntegerValue>[
      const IntegerValue('Please Select industry',0),
      const IntegerValue('Private Person',1311),
      const IntegerValue('ECX Account',1320),
      const IntegerValue('Individual Traders',1330),
        ];
      }
//v.createElement();
      this.v=new DropDownIntegerValue(industrySetter, industries,103);

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
// this._customer.countryName=address.text;
// this._customer.city=address.text;
// this._customer.city=address.text;
// this._customer.city=address.text;




    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>CustomerCreateThree(this._customer)),
    );

  }

}







