

import 'package:onboarding/methods/Methods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';

import 'dart:convert' as convert;

import '../CommonDate.dart';

class CustomListView extends StatelessWidget {
  var listValue;
  CustomListView(this.listValue);
  @override
  Widget build(BuildContext context) {
    var listItem=listValue;
    var listTitle=ListView.builder(itemBuilder: (context,index){
     if(index==0)
       return ListTile(
        onTap: null,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Tr_Id" ),
              Text("Date"),
              Text("Debit"),
              Text("credit"),
              Text("end blance"),
            ]
        ),
      );
       return ListTile(
        leading: Icon(Icons.money),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('index: $index'),
            // Text(listItem[index]),
            // Text(listItem[index]),
            // Text(listItem[index]),
            // Text(listItem[index]),
          ],
        ),
      );

    });


    return listTitle;
  }


}