
import 'package:flutter/material.dart';
class LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
    text: 'COOP-BANK',
    style: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    ),
    children: [
    TextSpan(
    text: '',
    style: TextStyle(color: Colors.black, fontSize: 40),
    ),
    TextSpan(
    text: '',
    style: TextStyle(color: Colors.black, fontSize: 30),
    ),
      TextSpan(
        text: '\nCustomer On-boarding\n',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    ]),
    );;
  }
}
