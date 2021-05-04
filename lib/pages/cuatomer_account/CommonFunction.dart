//
//
//
// Widget titleText(var val, double size, Color color) {
//   return Container(
//       child: Text(
//         val,
//         style: TextStyle(
//             color: color,
//             fontSize: size,
//             fontWeight: FontWeight.bold,
//             wordSpacing: 3),
//       ));
// }
//
// Widget valueRow(var val, double size, Color color) {
//   return Text(
//     val,
//     style: TextStyle(
//       color: color,
//       fontSize: size,
//     ),
//   );
// }
//
// Widget valueText({var value, double textSize, Color textColor}) {
//   return Container(
//       padding: EdgeInsets.only(left: 20),
//       child: Container(
//           width: double.infinity,
//           // height: 40,
//           padding: EdgeInsets.only(top: 5, bottom: 5),
//           decoration: BoxDecoration(
//               border: Border.all(width: .5),
//               color: CustomColor.textBack,
//               borderRadius: BorderRadius.circular(4)),
//           child: Text(
//             value,
//             style: TextStyle(
//               color: textColor,
//               fontSize: textSize,
//             ),
//           )));
// }
//
// Widget elevatedButton({Object object, var command, Color buttonColorText=Colors.white,var data,Object object}) {
//   return ElevatedButton(
//       style:
//       ElevatedButton.styleFrom(
//           shadowColor: Colors.white,
//           elevation: 10,
//           primary: CustomColor.cyan_blue
//       ),
//       onPressed: () {
//
//       },
//       child: Text(
//         command,
//         style: TextStyle(color: buttonColorText),
//       ));
// }
//
// Widget compositeTextNull({var title, double titleSize = 16, Color titleColor = Colors.white, Color textColor = Colors.white, double textSize = 12, var value, var commandText,Object, object}) {
//   return Column(
//     crossAxisAlignment:CrossAxisAlignment.stretch ,
//
//     children: [
//       if(value != null)
//         titleText(title, titleSize,titleColor),
//       Padding(
//           padding: const EdgeInsets.only(left: 20.0, bottom: 5,right: 20.0),
//           child: (value != null
//               ? valueText(value:value, textSize:textSize, textColor:textColor)
//               : elevatedButton(object:object, command:commandText)
//           )
//       ),
//     ],
//   );
// }
//
// Widget compositeTextNoButton({String title, double textSize=12, double titleSize=16, Color titleColor = Colors.black, Color textColor=Colors.black, var value, var commandText}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       titleText(title, titleSize, titleColor),
//       Padding(
//           padding: const EdgeInsets.only(left: 20.0, bottom: 10),
//           child: (value != null
//               ? valueText(value:value, textSize:textSize, textColor:textColor)
//               : valueText(
//               value:'Not Set',
//               textSize:textSize,
//               textColor:textColor
//           )
//           )
//       ),
//     ],
//   );
// }
//
// Widget compositeTextBoolean({var title, bool value, var message, Color titleColor=Colors.black, Color textColor=Colors.black, double titleSize=16, double textSize=12}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       titleText(title, titleSize, titleColor),
//       Padding(
//           padding: const EdgeInsets.only(left: 20.0, bottom: 5),
//           child: (value
//               ? valueText(value:message, textSize: 12, textColor:titleColor)
//               : elevatedButton(
//               //func:()=>createBankAccount(this._data),
//               command: message
//           )
//           )
//       ),
//     ],
//   );
// }
//
