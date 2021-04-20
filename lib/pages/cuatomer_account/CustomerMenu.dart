import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/composed_widjet/application_bar.dart';
import 'package:flutter/material.dart';


class BalanceEnquery extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<BalanceEnquery> {
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
        // appBar: ApplicationBar('Balance Inquiry').buildPreferredSize(),
        appBar: APPBarChieledPage("Customer Create",'').buildPreferredSize(),
        body: Container(
          color: CustomColor.white,
           width: double.infinity,
             height: double.infinity,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child: getOrintationList())
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


          // CustomCard(BalanceEnquery(),"Wallet Balance", '',Colors.white,Colors.black,new Icon(Icons.account_balance) ,50),
          // CustomCard(BalanceEnquery(),"Bank Balance", "",Colors.white,Colors.black,Icon(Icons.account_balance),50),
        ],
        );
      },
    );
  }



}


