import 'package:flutter/material.dart';
import 'package:onboarding/custom_color/custom_color.dart';

class StringValue {
  const StringValue(this.name,this.value);
  final String name;
  final String value;
}
class IntegerValue {
  const IntegerValue(this.name,this.value);
  final String name;
  final int value;
}


class DropDownStringValue extends StatefulWidget {
  double width;
  Function setOperation;
  List<StringValue> operationList;
  DropDownStringValue(this.setOperation, this.operationList,this.width);

  State createState() =>  DropDownStringValueState(setOperation,operationList,this.width);
}
class DropDownStringValueState extends State<DropDownStringValue> {
  double widht;
  Function setOpeation;
  List<StringValue> operationList;
  DropDownStringValueState(this.setOpeation,this.operationList,this.widht);
  StringValue selectedUser;
  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.0, color: Colors.white)
        ),

        child: DropdownButton<StringValue>(
          underline: Container(
            height: 0,
            color: CustomColor.white,

          ),
          hint:  Text(
            operationList[0].name,
            style: TextStyle(color:CustomColor.white,),),
          icon: Icon(                // Add this
            Icons.arrow_downward_outlined,  // Add this
            color: CustomColor.cyan_blue,
          ),
          dropdownColor:CustomColor.cyan_blue,

          value: selectedUser,
          onChanged: (StringValue Value) {
            setState(() {
              selectedUser = Value;
              setOpeation(selectedUser.value);
            });
          },
          items: operationList.map((StringValue user) {
            return  DropdownMenuItem<StringValue>(
              value: user,
              child: Row(
                children: <Widget>[
                  //user.icon,
                  SizedBox(width: 40,),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      user.name,
                      style:  TextStyle(color: CustomColor.white

                      ),
                    ),

                  ),
                ],
              ),
            );
          }).toList(),
        ));
  }
}


class DropDownIntegerValue extends StatefulWidget {
  //String hintText;
  double width;
  Function setOperation;
  List<IntegerValue> operationList;
  DropDownIntegerValue(this.setOperation, this.operationList,this.width);

  State createState() =>  DropDownIntegerValueState(setOperation,operationList,this.width);
}
class DropDownIntegerValueState extends State<DropDownIntegerValue> {
  double widht;
  Function setOpeation;
  List<IntegerValue> operationList;
  DropDownIntegerValueState(this.setOpeation,this.operationList,this.widht);
  IntegerValue selectedUser;
  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.0, color: Colors.white)
        ),

        child: DropdownButton<IntegerValue>(
          underline: Container(
            height: 0,
            color: CustomColor.white,

          ),
          hint:  Text(
            operationList[0].name,
            style: TextStyle(color:CustomColor.white,),),
          icon: Icon(                // Add this
            Icons.arrow_downward_outlined,  // Add this
            color: CustomColor.cyan_blue,
          ),
          dropdownColor:CustomColor.cyan_blue,

          value: selectedUser,
          onChanged: (IntegerValue Value) {
            setState(() {
              selectedUser = Value;
              setOpeation(selectedUser.value);
            });
          },
          items: operationList.map((IntegerValue user) {
            return  DropdownMenuItem<IntegerValue>(
              value: user,
              child: Row(
                children: <Widget>[
                  //user.icon,
                  SizedBox(width: 40,),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      user.name,
                      style:  TextStyle(color: CustomColor.white

                      ),
                    ),

                  ),
                ],
              ),
            );
          }).toList(),
        ));
  }
}

class NumberList extends StatefulWidget {
  String hintText;
  double width;
  Function setOperation;
  List<int> operationList;
  NumberList(this.setOperation, this.operationList,this.hintText,this.width);

  State createState() =>  NumberListState(setOperation,operationList,this.hintText,this.width);
}
class NumberListState extends State<NumberList> {
  double widht;
  Function setOpeation;
  List<int> operationList;

  var hintText;
  NumberListState(this.setOpeation,this.operationList,this.hintText,this.widht);
  int selectedUser;
  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.0, color: Colors.white)
        ),

        child: DropdownButton<int>(
          underline: Container(
            height: 0,
            color: CustomColor.white,

          ),
          hint:  Text(
            'Please Select Year', style: TextStyle(color:CustomColor.white,),),
          icon: Icon(                // Add this
            Icons.arrow_downward_outlined,  // Add this
            color: CustomColor.cyan_blue,
          ),
          dropdownColor:CustomColor.cyan_blue,

          value: selectedUser,
          onChanged: (int Value) {
            setState(() {
              selectedUser = Value;
              setOpeation(selectedUser);
            });
          },
          items: operationList.map((int user) {
            return  DropdownMenuItem<int>(
              value: user,
              child: Row(
                children: <Widget>[
                  //user.icon,
                  SizedBox(width: 40,),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      user.toString(),
                      style:  TextStyle(color: CustomColor.white),
                    ),

                  ),
                ],
              ),
            );
          }).toList(),
        ));
  }
}



