

import 'package:onboarding/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

import 'package:onboarding/awidjet/custom_text.dart';
class ApplicationBar extends StatelessWidget{
  String title;
  ApplicationBar(this.title);
  double walletBalance;

  double bankBalance;

  @override
  Widget build(BuildContext context) {
    return this.buildPreferredSize();
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize:Size.fromHeight(140.0),
      child: AppBar(
         backgroundColor: CustomColor.black,
        elevation: 10,
        flexibleSpace:
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Image.asset('images/logo.png',height: 90.0,),
                              // Text("Cooperative Bank",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Center(child: HeaderText(title,  20.5,2.5,CustomColor.cyan_blue)),
                              ),
                            ],
                          ),
                        ),


          ),



      );

  }

   
}
class APPBarChieledPage extends StatelessWidget{
  String title;
  String subTitle;
  APPBarChieledPage(this.title,this.subTitle);
  @override
  Widget build(BuildContext context) {
    return this.buildPreferredSize();
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize:Size.fromHeight(120.0),
      child: AppBar(
        elevation: 10,
        backgroundColor: CustomColor.cyan_blue,
        flexibleSpace: Container(
         // color: CustomColor.white,

          child: Padding(
            padding: const EdgeInsets.only(top: 40),


            child: Wrap(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: HeaderText(title,  25.5,0.0,CustomColor.white,)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(subTitle, 20.2, 0.0, CustomColor.white)

                  ],
                )
              ],

            ),
          ),
        ),

      ),
    );

  }

}
class SmallerBar extends StatelessWidget{
  String title;
  double walletBalance;
  double bankBalance;

  SmallerBar(this.title);
  @override
  Widget build(BuildContext context) {
    return this.buildPreferredSize();
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize:Size.fromHeight(80.0),
      child: AppBar(
        backgroundColor: CustomColor.cyan_blue,
        flexibleSpace: Container(
          color: CustomColor.cyan_blue,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Wrap(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: HeaderText(title,  20.5,2.5, Colors.white,)),
                  //child: Center(child: HeaderText(title,  20.5,2.5,const Color(0xff00aeef),)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  ],
                )
              ],

            ),
          ),
        ),

      ),
    );

  }

}