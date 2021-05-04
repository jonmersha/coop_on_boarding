
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MyTextField extends StatelessWidget {
  var  controller=TextEditingController();
  String hintText;
  Colors mainColor;
  Colors hintColor;
  MyTextField(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 2, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          // border: Border.all(
          //     width: 1, //
          //     color:CustomColor.cyan_blue//                 <--- border width here
          // ),
        ),
          child: TextField(
            style: TextStyle(
                color: CustomColor.cyan_blue,
                //fontSize: 15.0

            ),
            controller: controller,
           // cursorColor: CustomColor.cyan_blue,
            inputFormatters: [LengthLimitingTextInputFormatter(13)],
            keyboardType:TextInputType.numberWithOptions(
            ) ,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomColor.cyan_blue),
                ),
              //border: InputBorder.none,
              labelText: hintText,

              hintStyle: TextStyle(color: CustomColor.cyan_blue)
            ),
          ),

      );
  }
}