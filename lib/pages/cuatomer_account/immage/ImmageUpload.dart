import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/CustomDropDown.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/awidjet/dropdown_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/methods/Methods.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_2.dart';


class ImaheUploadCoreSystem extends StatefulWidget {
  var data;

  var type;
  ImaheUploadCoreSystem(this.type,this.data);
  @override
  _ImaheUploadCoreSystemState createState() => _ImaheUploadCoreSystemState(this.type, this.data);
}

class _ImaheUploadCoreSystemState extends State<ImaheUploadCoreSystem> {

  int productType;
  String type;
  List<IntegerValue> imageType = <IntegerValue>[
    const IntegerValue('Select Image Type ',0),
    const IntegerValue('PHOTOS',1),
    const IntegerValue('SINATURES',2),


  ];

  var _data;
  _ImaheUploadCoreSystemState(this.type,this._data);


  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {

      });
    }
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("Customer On-Boarding",'Create Bank Account').buildPreferredSize(),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: DropDownIntegerValue(getImageType,imageType,200),
                ),

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(onPressed: ()=>createAccount(), child: Text('Create Account')))
              ],
            )
        )
    );

  }

  getImageType(String imagetype){
    setState(() {
      this.type=imagetype;
    });
  }

  getProductType(int productType) {
    setState(() {
      this.productType=productType;
    });
  }

  createAccount()  async{

    Methods.showLoaderDialog(context,'Creating Ban Account...');
    final http.Response response = await http.post(
      Uri.parse(CommonData.baseUrl+'/onboarding/account/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>
      {
        "imageType": type,
        "accountNumber": this.productType.toString(),
        "shortDescription": _data['firstName'],
        "description": _data['firstName']+" "+type,
        "imageName": _data['firstName']+_data['transactionId']+'.jpg',
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
          btnCancelOnPress:(){} ,
        ).show();

      }
    });
  }

  createUser() {

  }

}







