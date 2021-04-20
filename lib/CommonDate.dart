 import 'package:shared_preferences/shared_preferences.dart';

class CommonData{
    static final String baseUrl='http://192.168.43.228:8080';
    // static final String baseUrl='http://localhost:8080';
    static UserData userData;
    static String mobileNumber;

    static const  double padding=5.0;
    static const  double iconSize=40.0;

    static  MobileNumber() async {
   SharedPreferences prefs =  await SharedPreferences.getInstance();
   String mobileNumbers=prefs.getString('mobileNumber')??null;
   mobileNumber=mobileNumbers;
  // return mobileNumber;
  }

 }

 class UserData{
  String mobileNumber;
  String email;
  String firstName;
  String middleName;
  String lastName;
  double balance;
  double bankBalance;
  String language;

  UserData(val){
   this.mobileNumber=val['mobileNumber'];
   this.email=val['email'];
   this.firstName=val['firstName'];
   this.middleName=val['middleName'];
   this.lastName=val['lastName'];
   this.balance=val['balance'];
   this.language=val['language'];
   this.bankBalance=0.0;
  }


 }