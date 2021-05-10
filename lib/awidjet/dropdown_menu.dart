import 'package:flutter/material.dart';
import 'package:onboarding/custom_color/custom_color.dart';

// class Item {
//   const Item(this.name,this.itemId);
//
//
//   final String name;
//   final int itemId;
// // final Icon icon;
// }
// class StringItem {
//   const StringItem(this.name,this.shortCode);
//   final String name;
//   final String shortCode;
// // final Icon icon;
// }
//
//
// class MyDropDown extends StatefulWidget {
//   //String hintText;
//   double width;
//   Function setOpeation;
//   List<Item> operationList;
//   MyDropDown(this.setOpeation, this.operationList,this.width);
//
//   State createState() =>  MyDropDownState(setOpeation,operationList,this.width);
// }
// class MyDropDownState extends State<MyDropDown> {
//   double widht;
//   Function setOpeation;
//   List<Item> operationList;
//   MyDropDownState(this.setOpeation,this.operationList,this.widht);
//   Item selectedUser;
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.black87,
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(width: 1.0, color: Colors.white)
//         ),
//
//         child: DropdownButton<Item>(
//           underline: Container(
//             height: 0,
//             color: CustomColor.white,
//
//           ),
//           hint:  Text(
//                 operationList[0].name,
//                   style: TextStyle(color:CustomColor.white,),),
//           icon: Icon(                // Add this
//             Icons.arrow_downward_outlined,  // Add this
//             color: CustomColor.cyan_blue,
//           ),
//           dropdownColor:CustomColor.cyan_blue,
//
//           value: selectedUser,
//           onChanged: (Item Value) {
//             setState(() {
//               selectedUser = Value;
//               setOpeation(selectedUser.name);
//             });
//           },
//           items: operationList.map((Item user) {
//             return  DropdownMenuItem<Item>(
//               value: user,
//               child: Row(
//                 children: <Widget>[
//                   //user.icon,
//                   SizedBox(width: 40,),
//                   Container(
//                     padding: EdgeInsets.all(5.0),
//                       child: Text(
//                         user.name,
//                         style:  TextStyle(color: CustomColor.white
//
//                         ),
//                       ),
//
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ));
//   }
// }
//
// class MyDropDownNumeric extends StatefulWidget {
//   //String hintText;
//   double width;
//   Function setOpeation;
//   List<Item> operationList;
//   MyDropDownNumeric(this.setOpeation, this.operationList,this.width);
//
//   State createState() =>  MyDropDownNumericState(setOpeation,operationList,this.width);
// }
// class MyDropDownNumericState extends State<MyDropDownNumeric> {
//   double width;
//   Function setOperation;
//   List<Item> operationList;
//   MyDropDownNumericState(this.setOperation,this.operationList,this.width);
//   Item selectedUser;
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//       height: 35,
//       padding: EdgeInsets.symmetric(horizontal: 3.0),
//
//       decoration: BoxDecoration(
//           color: Colors.black87,
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(width: 1.0, color: Colors.white)
//       ),
//
//
//       child: DropdownButton<Item>(
//           underline: Container(
//             height: 0,
//             color: CustomColor.transparent,
//           ),
//           hint:  Text(operationList[0].name,style: TextStyle(color:Colors.white),),
//         icon: Icon(                // Add this
//           Icons.arrow_downward_outlined,  // Add this
//           color: CustomColor.cyan_blue,
//         ),
//         dropdownColor:CustomColor.cyan_blue,
//           value: selectedUser,
//           onChanged: (Item Value) {
//             setState(() {
//               selectedUser = Value;
//               setOperation(selectedUser.itemId);
//
//             });
//           },
//           items: operationList.map((Item user) {
//             return  DropdownMenuItem<Item>(
//               value: user,
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                    // width: widht,
//                     child: Text(
//                       user.name,
//                       style:  TextStyle(color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       );
//   }
// }