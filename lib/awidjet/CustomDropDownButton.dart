import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  String nationalitVal;


  CustomDropDownButton(this.nationalitVal);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {


  @override
  Widget build(BuildContext context) {
    var nationalitVal;
    return DropdownButton<String>(
      value: nationalitVal,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String newValue) {
        setState(() {
          nationalitVal = newValue;
        });
      },
      items: <String>['', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }
}
