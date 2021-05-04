
import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/custom_text.dart';
import 'package:onboarding/awidjet/image_avatar.dart';
import 'package:onboarding/awidjet/tab.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  String fullName='Customer on Boarding';
  //String balance='Balance: '+ CommonData.userData.balance.toString();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: ApplicationBar(fullName).buildPreferredSize(),
      body: Tabs(),

      drawer: Drawer(
        child: Container(
          //color: Colors.lightBlueAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    DrowerImage("logo.png",'',9,context),
                    CustomText(fullName,14.0,1.5,Colors.white),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),

              ),
              Divider(
                color: Colors.cyanAccent,
                thickness: 3,
                indent: 40,
                endIndent: 20,
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('Account Management',style: TextStyle(color: Colors.white),),onPressed: ()=>{},)
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('Apply For Bank Account',style: TextStyle(color: Colors.white),),onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    CommonData.userData=null;
                  },)
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 40.0,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('logout',style: TextStyle(color: Colors.white),),onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    CommonData.userData=null;
                  },
                  )
    ),
              Divider(
                color: Colors.cyanAccent,
                thickness: 3,
                indent: 40,
                endIndent: 20,
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('Account Management',style: TextStyle(color: Colors.white),),onPressed: ()=>{},)
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('logout',style: TextStyle(color: Colors.white),),onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    CommonData.userData=null;
                  },)
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 40.0,
                  color: Colors.lightBlueAccent,
                  child: FlatButton(child: Text('Share',style: TextStyle(color: Colors.white),),onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    CommonData.userData=null;
                  },
                  )
              ),
            ],
          ),
        ),
      ),
    );

  }
}
