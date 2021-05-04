import 'package:onboarding/pages/customer_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommonDate.dart';

 void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(OnBoardingApp());
}
_getMobileNumber() async{
  SharedPreferences prefs =  await SharedPreferences.getInstance();
  String userName=prefs.getString('userName')??null;
  CommonData.userName=userName;
  return userName;
}
class OnBoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/onb_back.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: MaterialApp(
    title: "Customer OnBoarding",
    theme: ThemeData(
    fontFamily: 'Arial'
    ),
    home: CustomerHome(title:"Customer OnBoarding"),
    ),
  );


  }
 // _getMobileNumber();

}









  