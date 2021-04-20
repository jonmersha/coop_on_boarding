import 'package:flutter/material.dart';
import 'package:onboarding/custom_color/custom_color.dart';



class MyDropDown extends StatefulWidget {
  //String hintText;
  double width;
  Function setOpeation;
  List<Item> operationList;
  MyDropDown(this.setOpeation, this.operationList,this.width);

  State createState() =>  MyDropDownState(setOpeation,operationList,this.width);
}
class Item {
  const Item(this.name,this.itemId);


  final String name;
  final int itemId;
 // final Icon icon;
}
class MyDropDownState extends State<MyDropDown> {
  double widht;
  Function setOpeation;
  List<Item> operationList;
  MyDropDownState(this.setOpeation,this.operationList,this.widht);
  Item selectedUser;
  @override
  Widget build(BuildContext context) {
    return   Container(

      height: 40,
      width: widht,

      padding: EdgeInsets.symmetric(horizontal: 5.0),

      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),


        child: DropdownButton<Item>(
          underline: Container(
            height: 0,
            color: CustomColor.transparent,
          ),
          hint:  Text(operationList[0].name,style: TextStyle(color:Colors.black),),
          value: selectedUser,
          onChanged: (Item Value) {
            setState(() {
              selectedUser = Value;
              setOpeation(selectedUser.name);

            });
          },
          items: operationList.map((Item user) {
            return  DropdownMenuItem<Item>(
              value: user,
              child: Row(

                children: <Widget>[
                  //user.icon,
                 // SizedBox(width: 40,),
                  Container(
                   // width: widht,
                    child: Text(
                      user.name,
                      style:  TextStyle(color: Colors.black

                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
  }
}