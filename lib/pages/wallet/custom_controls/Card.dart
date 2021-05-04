import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/awidjet/custom_text.dart';
import 'package:onboarding/awidjet/flat_button.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CustomCard extends StatelessWidget {
  String title;
  String boyText;
  Object object;
  Color colors;

  Color colorBack;
  Color colorHeader;
  Color colorBody;
  Icon icon;
  Icons myIcon;
  double iconSize;
  CustomCard(this.object,this.title,this.boyText,this.colorBack,this.colorHeader,this.icon,this.iconSize){
    //iconSize=50;

  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 10.2,
           color:CustomColor.black,
           shadowColor: CustomColor.cyan_blue,
          borderOnForeground: true,

          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>object),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        CustomFlatButton(this.object,this.icon,this.title,context,iconSize,colorHeader),
                        Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20,top: 0),
                            color: Colors.blue,
                            width: double.infinity,
                            height: .8),

                        HeaderText(title, 16, 0, colorHeader,),

                       //Center(child: CustomText(boyText, 13, 1,Colors.white )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class BalanceCard extends StatelessWidget {

  String title;
  String boyText;
  Object object;
  Icon incons;
  Color colors;
  BalanceCard(this.object, this.title, this.boyText, this.incons, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        color: this.colors,
        child: InkWell(

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>object),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              children: <Widget>[
                Center(

                  child: Column(
                    children: <Widget>[
                      HeaderText(title, 17, 0, CustomColor.black,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: CustomColor.cyan_blue,
                        width: double.infinity,
                      height: 4.5,),
                    ),
                     CustomFlatButton(this.object, this.incons,this.title,context,100,Colors.white),
                      //Center(child: CustomText(boyText, 13, 1, Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HeaderCard extends StatefulWidget {
   String title;
   double balance;
   Color colorBack;
   Color colorHeader;
   Color colorBody;
   bool iswallet;
  HeaderCard(this.title, this.balance,this.colorBack,this.colorHeader,this.colorBody, this.iswallet);

  @override
  _HeaderCardState createState() => _HeaderCardState(this.iswallet);
}
class _HeaderCardState extends State<HeaderCard> {
   bool osbcureText;
   bool isWallet;

  _HeaderCardState(bool iswallet){
    this.isWallet=iswallet;
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: CustomColor.semi,
          elevation: 100,
          shadowColor: Colors.red,
          child: InkWell(
            onTap: () {
             // if(iswallet)
              walletBalance();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        HeaderText(this.widget.title, 15, 0, this.widget.colorHeader,),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color: CustomColor.cyan_blue,
                         // width: double.infinity,
                           height: 4.5,),
                      ),
                       CustomText('ETB '+this.widget.balance.toString(), 17, 1.4, this.widget.colorBody)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   void walletBalance() async{
     Methods.showLoaderDialog(context,'Login Wait...');
     final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/customer/balance'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>
       {"phoneNumber":CommonData.userName}
       ),
     );
     setState(() {
       if(response.statusCode==200){
         Navigator.pop(context);
         var val=convert.jsonDecode(response.body);
       //  CommonData.userData.balance=val['balance'];
         this.widget.balance=val['balance'];
           AwesomeDialog(
             context: context,
             dialogType: DialogType.SUCCES,
             animType: AnimType.BOTTOMSLIDE,
             title: 'Wallet Balance',
             desc: 'Your Wallet Balance'+val['balance'].toString(),
             btnOkOnPress:(){} ,
           ).show();
        // }
       }
       else{
         AwesomeDialog(
           context: context,
           dialogType: DialogType.ERROR,
           animType: AnimType.BOTTOMSLIDE,
           title: 'Error Requesting Balance',
           desc: 'Error Requesting Balance: '+response.statusCode.toString(),
           btnOkOnPress:(){} ,
         ).show();


       }
     });
   }
}