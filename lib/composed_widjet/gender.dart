import 'package:flutter/material.dart';

class CustomerGender extends StatefulWidget {
  const CustomerGender({Key key}) : super(key: key);

  @override
  _CustomerGenderState createState() => _CustomerGenderState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomerGenderState extends State<CustomerGender> {
  String dropdownValue = 'Select Gender';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Select Gender', 'MALE', 'FEMALE',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}