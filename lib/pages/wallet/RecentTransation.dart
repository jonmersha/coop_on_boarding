import 'dart:convert';
import 'package:onboarding/custom_color/custom_color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../CommonDate.dart';

class RecentTransaction extends StatefulWidget{
@override
  _RecentTransaction createState()=>_RecentTransaction();

}

class _RecentTransaction extends State<RecentTransaction>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recentTransaction(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }

    recentTransaction() async{
      final http.Response response = await http.post(
        Uri.parse(CommonData.baseUrl+'/customer/recent_transaction'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>
        {"phoneNumber":CommonData.mobileNumber}
        ),
      );
      if(response.statusCode==200){
        var val=convert.jsonDecode(response.body);
      // return  tableList(val);
        return dataTable(val);
      }

  }
  ListView tableList(data){
    return ListView(
        children:[
          Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Table(
              //defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 0),
              children: [
                TableRow(

                    children: [
                 Container(
                     color:Colors.redAccent,
                     width: double.infinity,
                     height: 40.0,

                     child: Text('Transaction ID', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))),
                  Container(
                      color:Colors.redAccent,
                      width: double.infinity,
                      height: 40.0,
                      child: Text('Transaction Date', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))),
                  Container(
                      color:Colors.redAccent,
                      width: double.infinity,
                      height: 40.0,
                      child: Text('Debit', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))),
                  Container(
                      color:Colors.redAccent,
                      width: double.infinity,
                      height: 40.0,
                      child: Text('Credit', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))),
                  Container(
                      color:Colors.redAccent,
                      width: double.infinity,
                      height: 40.0,

                      child: Text('balance', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))),
                ]),
                for(int x=0;x<data.length;x++)
                TableRow( children: [
                  Container(
                      color:Colors.blue,
                      width: double.infinity,
                      height: 60,
                      child: Text(data[x]["transactionId"].toString())),
                  Container(
                      color:Colors.green,
                      width: double.infinity,
                      height: 60,
                      child: Text(data[x]["transactionDate"].toString())),
                  Container(
                      color:Colors.blue,
                      width: double.infinity,
                      height: 60,
                      child: Text(data[x]["debitAmount"].toString())),
                  Container(
                      color:Colors.green,
                      width: double.infinity,
                      height: 60,
                      child: Text(data[x]["creditAmount"].toString())),
                  Container(
                      color:Colors.blue,
                      width: double.infinity,
                      height: 60,
                      child: Text(data[x]["balance"].toString())),


                ]),
              ],
            ),
          ),
        ])
    ]);
  }


  dataTable(data){
   return ListView(
     children:[ DataTable(
       headingRowColor:
       MaterialStateColor.resolveWith((states) => CustomColor.cyan_blue),
       columnSpacing: 10.0,
        columns:  <DataColumn>[
          DataColumn(
            label: Text(
              'Tr_Id',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Tr_date',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Debit',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
            ),
          ),
          DataColumn(
            label: Text(
              'credit',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Balance',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
            ),
          ),
        ],
        // for(int x=0;x<data.length;x++){}
        rows: <DataRow>[

          for(int x=0;x<data.length;x++)

          DataRow(
            color: MaterialStateColor.resolveWith((states) {
              return x % 2 == 0 ? Colors.lightBlue[100] : Colors.lightGreen[50]; //make tha magic!
            }),

            cells: <DataCell>[

              DataCell(

                  Text(data[x]["transactionId"].toString())),
              DataCell(
                  Text(data[x]["transactionDate"].toString())),
              DataCell(
                  Text(data[x]["debitAmount"].toString())),
              DataCell(
                  Text(data[x]["creditAmount"].toString())),
              DataCell(
                  Text(data[x]["balance"].toString())),
            ],
          ),
        ],
      ),
  ] );
  }




}