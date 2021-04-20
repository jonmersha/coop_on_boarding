import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:onboarding/pages/user_account/change_password.dart';
import 'package:flutter/material.dart';


import '../pages/wallet/custom_controls/Card.dart';

class AcountManagement extends StatefulWidget {
  @override
  _AcountManagemntState createState() => _AcountManagemntState();
}

class _AcountManagemntState extends State<AcountManagement> {
  bool button=true;
  final  PIN=TextEditingController();
  final  cashierID=TextEditingController();

  final  amount=TextEditingController();
  bool amountEnabled=false;
  String amountHint='';
  final   adminPin=TextEditingController();
  bool adminPinEnabled=false;
  String adminHint='';

  int operationType=0;

  String title='Cashier Management';


  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        operationType=type;
      });
    }
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Account",'Account').buildPreferredSize(),
        body: Container(
          color: CustomColor.cyan_blue,
           width: double.infinity,
             height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onb_back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: getOrintationList()

        )
    );
  }
  void enableCashiers(BuildContext context) {
    Navigator.pop(context);
  }


  OrientationBuilder getOrintationList(){
    return  OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisSpacing:4 ,
          mainAxisSpacing: 5,
          childAspectRatio:(1.2),
          crossAxisCount: orientation == Orientation.portrait ? 2:4, children: <Widget>[
          CustomCard(ChangePass(),"change Password", '',Colors.white,Colors.black,new Icon(Icons.account_balance) ,CommonData.iconSize),
          CustomCard(ChangePass(),"add Address", "",Colors.white,Colors.black,Icon(Icons.account_balance),CommonData.iconSize),
          CustomCard(ChangePass(),"photoUpload", "",Colors.white,Colors.black,Icon(Icons.account_balance),CommonData.iconSize),
          CustomCard(ChangePass(),"Id upload", "",Colors.white,Colors.black,Icon(Icons.account_balance),CommonData.iconSize),
          CustomCard(ChangePass(),"Signature Upload", "",Colors.white,Colors.black,Icon(Icons.account_balance),CommonData.iconSize),
          CustomCard(ChangePass(),"profile", "",Colors.white,Colors.black,Icon(Icons.account_balance),CommonData.iconSize),
        ],
        );
      },
    );
  }



}


