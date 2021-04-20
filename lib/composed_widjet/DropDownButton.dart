import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDowns extends StatefulWidget{
  List<String> list;
 // DropDown(this.list);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDowns> {
  var dropdownValue='Title';
  List<String> _list=['MR','MSS'];




  //_DropDownState(this._list);

  @override
  Widget build(BuildContext context) {
    List<String> mlists=[''];

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


      items: [_list.toSet().iterator.toString()]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}