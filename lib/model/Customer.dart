import 'package:floor/floor.dart';


@entity
class MyAccount{
   @primaryKey
   String mobileNumber;
   String email;
   String firstName;
   String middleName;
   String lastName;
   bool loginStatus;
}
@entity
class Customer{
   @primaryKey
   String mobileNumber;
   String email;
   String firstName;
   String middleName;
   String lastName;
   bool loginStatus;

}