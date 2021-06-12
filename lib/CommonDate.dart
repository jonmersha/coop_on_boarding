 import 'package:shared_preferences/shared_preferences.dart';
class CommonData{
    //static final String baseUrl='10.0.19.60:8080';
     static  String baseUrl='http://10.1.125.18:8080';
    //static final String baseUrl='http://192.168.43.228:8080';
    // static final String baseUrl='http://192.168.0.102:8080';
    // static final String baseUrl='http://localhost:8080';
     //static final String baseUrl='http://192.168.1.3:8080';
    static UserData userData;
    static String userName;
    static String passWord;

    static const  double padding=5.0;
    static const  double iconSize=40.0;

    static  MobileNumber() async {
   SharedPreferences prefs =  await SharedPreferences.getInstance();
   String useN=prefs.getString('userName')??null;
   userName=useN;
  // return mobileNumber;
  }

 }

 class UserData{
  String userName;
  String email;
  String firstName;
  String middleName;
  String branchCode;

  UserData(val){
   this.userName=val['userName'];
   this.firstName=val['firstName'];
   this.middleName=val['middleName'];
   this.branchCode=val['branchCode'];

  }


 }