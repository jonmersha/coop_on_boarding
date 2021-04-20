import 'package:flutter/material.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({Key key}) : super(key: key);

  @override
  _MaritalStatusState createState() => _MaritalStatusState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MaritalStatusState extends State<MaritalStatus> {
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
      items: <String>['Select Marital ', 'MARRIED', 'SINGLE','DIFORCED']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}