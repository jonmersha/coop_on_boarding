import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:onboarding/pages/customer_image/ImageProcessor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../CommonDate.dart';
import 'CustomerBankAccount.dart';
class CustomerDetailInformation extends StatefulWidget{
  var data;


  CustomerDetailInformation(this.data);
  @override
  _CustomerDetailInformationState createState() => _CustomerDetailInformationState(data);
}

class _CustomerDetailInformationState extends State<CustomerDetailInformation> {
  var _data;

  _CustomerDetailInformationState(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding", 'Customer Detail')
            .buildPreferredSize(),
        body: Container(
            color: CustomColor.pageBack,

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    titleText('Full Name', 15, Colors.black),
                    titleText('Middle name', 15, Colors.black),
                    titleText('Last name', 15, Colors.black),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      border: Border.all(width: .5),
                      color: CustomColor.textBack,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      valueRow(_data['firstName'], 20, Colors.black),
                      valueRow(_data['middleName'], 20, Colors.black),
                      valueRow(_data['lastName'], 20, Colors.black),
                    ],
                  ),
                ),
                compositeTextNoButton(
                    title: 'Customer ID',
                    titleSize: 16.0,
                    textSize: 16.0,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    value: _data['transactionId'],
                    commandText: 'Not Set'),
                compositeTextNoButton(
                    title: 'Authorization Status',
                    titleSize: 15.0,
                    textSize: 12.0,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    value: _data['authStatus'],
                    commandText: 'Not Set'),
                compositeTextNoButton(
                    title: 'Customer Email',
                    titleSize: 16.0,
                    textSize: 12.0,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    value: _data['email'],
                    commandText: 'Not Set'),
                compositeTextNull(
                    title: 'Customer Account Number',
                    titleSize: 16,
                    textSize: 12,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    function: createAccount,
                    data:_data,
                    value: _data['accountNumber'],
                    commandText: 'Create Bank Account Number',
                ),

                compositeTextImage(
                  title: 'Signature file Name',
                  value: _data['signatureImageName'],
                  commandText: 'Create Signature Name',
                  titleSize: 16,
                  textSize: 12,
                  titleColor: Colors.black,
                  textColor: Colors.black,
                    type:'SIGNATURES',
                    function: captureImage
                ),

                compositeTextImage(
                    title: 'Photo Name',
                    titleSize: 16,
                    textSize: 12,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    value: _data['personImageName'],
                    commandText: 'Create photo Name',
                    type:'PHOTOS',
                    function: captureImage
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: compositeTextBoolean(
                        title: 'Signature image',
                        value: _data['signatureImageUploaded'],
                        message: 'upload Signature',
                        titleColor: Colors.black,
                        textColor: Colors.black,
                        titleSize: 16.0,
                        textSize: 12,
                          func:uploadImage,
                          type:'SIGNATURES',
                          data:_data,
                      ),
                    ),
                    Expanded(
                      child: compositeTextBoolean(
                        title: 'Person Image',
                        value: _data['customerImmageUploaded'],
                        message: 'upload photo',
                        titleColor: Colors.black,
                        textColor: Colors.black,
                        titleSize: 16.0,
                        textSize: 12,
                        func:uploadImage,
                        type:'PHOTOS',
                        data:_data
                      ),
                    ),
                  ],
                ),
              ],
            )
        )

    );
  }

  createAccount(type,data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>new CustomerBankAccount(data)),
    );
  }
  uploadImage(type,data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>new ImageProcessor(type,data)),
    );
  }
  captureImage(type,data) async {
    print('Capture  Image');
    String path=CommonData.baseUrl+'/onboarding/image/capture';
    print(path);
    Methods.showLoaderDialog(context,'Capture Image...');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/onboarding/image/capture'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>
      {
        "imageType": type,
        "accountNumber": _data['accountNumber'],
        "shortDescription": _data['firstName'],
        "description": type+ "Image",
        "transactionId":_data['transactionId'],
       "imageName":data

      }
      ),
    );
    setState(() {
      if(response.statusCode==200){
        Navigator.pop(context);
        var val=convert.jsonDecode(response.body);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: val['status'],
          desc: val['messageBody'],
          btnOkOnPress:(){} ,
        ).show();

      }
    });

  }


  Widget titleText(var val, double size, Color color) {
    return Container(
        child: Text(
          val,
          style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
        ));
  }

  Widget valueRow(var val, double size, Color color) {
    return Text(
      val,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }

  Widget valueText({var value, double textSize, Color textColor}) {
    return Container(
        padding: EdgeInsets.only(left: 20),
        child: Container(
            width: double.infinity,
            // height: 40,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(width: .5),
                color: CustomColor.textBack,
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
            )));
  }
  Widget elevatedButton(
      {Function function,
        var data,
        var command,
        Color buttonColorText = Colors
          .white, type,}) {
    return ElevatedButton(
        style:
        ElevatedButton.styleFrom(
            shadowColor: Colors.white,
            elevation: 10,
            primary: CustomColor.cyan_blue
        ),
        onPressed: () {function(type,data);

        },
        child: Text(
          command,
          style: TextStyle(color: buttonColorText),
        ));
  }
  Widget compositeTextNull(
      {var title, double titleSize = 16, Color titleColor = Colors
          .white, Color textColor = Colors
          .white, double textSize = 12, var value, var commandText, Function function,var data, String type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         if(value != null)
          titleText(title, titleSize, titleColor),
        Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5, right: 20.0),
            child: (value != null
                ? valueText(
                value: value, textSize: textSize, textColor: textColor)
                : elevatedButton(function: function,data:data, command: commandText,type: type)
            )
        ),
      ],
    );
  }

  Widget compositeTextNoButton(
      {String title, double textSize = 12, double titleSize = 16, Color titleColor = Colors
          .black, Color textColor = Colors.black, var value, var commandText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title, titleSize, titleColor),
        Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10),
            child: (value != null
                ? valueText(
                value: value, textSize: textSize, textColor: textColor)
                : valueText(
                value: 'Not Set',
                textSize: textSize,
                textColor: textColor
            )
            )
        ),
      ],
    );
  }

  Widget compositeTextBoolean(
      {var title, bool value, var message, Color titleColor = Colors
          .black, Color textColor = Colors
          .black, double titleSize = 16, double textSize = 12, Function func, data, var type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title, titleSize, titleColor),
        Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5),
            child: elevatedButton(
                function: func,
                type:type,
                data:data,
                command: message
            )
            //)
        ),
      ],
    );
  }

  Widget compositeTextImage(
      {
        var title, double titleSize = 16, Color titleColor = Colors
          .white, Color textColor = Colors
          .white, double textSize = 12, var value, var commandText, Function function,var data, String type}) {
    if(value==null)
    value='image Not Uploaded';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          titleText(title, titleSize, titleColor),
          valueText(value: value, textSize: textSize, textColor: textColor),
          elevatedButton(function: function,data:data, command: commandText,type: type)
      ],
    );
  }



}