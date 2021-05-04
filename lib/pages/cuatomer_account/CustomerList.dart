import 'dart:convert';
import 'package:onboarding/custom_color/custom_color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:onboarding/pages/cuatomer_account/CustomerDetailInformation.dart';
import 'dart:convert' as convert;

import '../../CommonDate.dart';

class CustomerList extends StatefulWidget {
  @override
  _RecentTransaction createState() => _RecentTransaction();
}

class _RecentTransaction extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: customerList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  customerList() async {
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl + '/onboarding/customer/lists'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"accountCreator": CommonData.userName}),
    );
    if (response.statusCode == 200) {
      var val = convert.jsonDecode(response.body);
      print(val);
      return dataTable(val);
    }
  }

  dataTable(data) {
    return ListView(children: [
      DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => CustomColor.black),
        columnSpacing: 10.0,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Customer-Id',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15.0),
            ),
          ),

          DataColumn(
            label: Text(
              'Customer-Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12.0),
            ),
          ),


          DataColumn(
            label: Text(
              'More-Action',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12.0),
            ),
          ),
        ],
        // for(int x=0;x<data.length;x++){}
        rows: <DataRow>[
          for (int x = 0; x < data.length; x++)
            DataRow(
              color: MaterialStateColor.resolveWith((states) {
                return x % 2 == 0
                    ? Colors.lightBlue[100]
                    : Colors.lightGreen[50]; //make tha magic!
              }),
              cells: <DataCell>[
                DataCell(Text(data[x]["transactionId"].toString())),
                DataCell(Text(data[x]["firstName"].toString()+'-'+data[x]["middleName"].toString())),
                DataCell(
                    ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          primary: CustomColor.cyan_blue,
                          elevation: 2
                      ),
                  child: Text('More-Action'),
                  onPressed: ()=>moreDetail(data[x]),
                ))
              ],
            ),
        ],
      ),
    ]);
  }

  moreDetail(data) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>new CustomerDetailInformation(data)),
      );

    }

}


