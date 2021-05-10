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

class BankCustomer{

   String cashierCode;
   String cashierPassword;
   String title;
    String firstName;
   String middleName;
   String lastName;
   String maritalStatus;
   String gender;
   String dob;
   String officeTelNumber;
   String mobilePhoneNumber;
   String emailId;
   String messageID;
   String mnemonic;
   String city;
   String streetName;
   String poBox;
   String address;

   String country;
   String countryName;

   int sector;
   String sectorName;
   int industry;
   String industryName;
   int target;
   String targetName;
   String idNumber;
   String documentName;
   String nameOnDocument;
   String issueAuthority;
   String issueDate;
   String expirationDate;



   BankCustomer(
       {  this.cashierCode,
          this.cashierPassword,
          this.title,
          this.firstName,
          this.middleName,
          this.lastName,
          this.maritalStatus,
          this.gender,
          this.dob,
          this.officeTelNumber,
          this.mobilePhoneNumber,
          this.emailId,
          this.messageID,
          this.mnemonic,
          this.city,
          this.streetName,
          this.poBox,
          this.address,
          this.country,
          this.sector,
          this.industry,
          this.target,
          this.idNumber,
          this.documentName,
          this.nameOnDocument,
          this.issueAuthority,
          this.issueDate,
          this.expirationDate});

   BankCustomer.fromJson(Map<String, dynamic> json) {
      cashierCode = json['cashierCode'];
      cashierPassword = json['cashierPassword'];
      title = json['title'];
      firstName = json['firstName'];
      middleName = json['middleName'];
      lastName = json['lastName'];
      maritalStatus = json['maritalStatus'];
      gender = json['gender'];
      dob = json['dob'];
      officeTelNumber = json['officeTelNumber'];
      mobilePhoneNumber = json['mobilePhoneNumber'];
      emailId = json['emailId'];
      messageID = json['messageID'];
      mnemonic = json['mnemonic'];
      city = json['city'];
      streetName = json['streetName'];
      poBox = json['poBox'];
      address = json['address'];
      country = json['country'];
      sector = json['sector'];
      industry = json['industry'];
      target = json['target'];
      idNumber = json['idNumber'];
      documentName = json['documentName'];
      nameOnDocument = json['nameOnDocument'];
      issueAuthority = json['issueAuthority'];
      issueDate = json['issueDate'];
      expirationDate = json['expirationDate'];
   }

   Map<String, String> toJson() {
      final Map<String, String> data = new Map<String, String>();
      data['cashierCode'] = this.cashierCode;
      data['cashierPassword'] = this.cashierPassword;
      data['title'] = this.title;
      data['firstName'] = this.firstName;
      data['middleName'] = this.middleName;
      data['lastName'] = this.lastName;
      data['maritalStatus'] = this.maritalStatus;
      data['gender'] = this.gender;
      data['dob'] = this.dob;
      data['officeTelNumber'] = this.officeTelNumber;
      data['mobilePhoneNumber'] = this.mobilePhoneNumber;
      data['emailId'] = this.emailId;
      data['messageID'] = this.messageID;
      data['mnemonic'] = this.mnemonic;
      data['city'] = this.city;
      data['streetName'] = this.streetName;
      data['poBox'] = this.poBox;
      data['address'] = this.address;
      data['country'] = this.country;
      data['sector'] = this.sector.toString();
      data['industry'] = this.industry.toString();
      data['target'] = this.target.toString();
      data['idNumber'] = this.idNumber;
      data['documentName'] = this.documentName;
      data['nameOnDocument'] = this.nameOnDocument;
      data['issueAuthority'] = this.issueAuthority;
      data['issueDate'] = this.issueDate;
      data['expirationDate'] = this.expirationDate;
      return data;
   }

}

class BankAccount {
  String customerID;
  String productCode;
  String accountName;
  String shortName;
  String currency;
  String messageId;

  BankAccount(
      {this.customerID,
        this.productCode,
        this.accountName,
        this.shortName,
        this.currency,
        this.messageId});

  BankAccount.fromJson(Map<String, String> json) {
    customerID = json['customerID'];
    productCode = json['productCode'];
    accountName = json['accountName'];
    shortName = json['shortName'];
    currency = json['currency'];
    messageId = json['messageId'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['customerID'] = this.customerID;
    data['productCode'] = this.productCode;
    data['accountName'] = this.accountName;
    data['shortName'] = this.shortName;
    data['currency'] = this.currency;
    data['messageId'] = this.messageId;
    return data;
  }
}

class Branch {
  String branchCode;
  String branchName;
  String region;
  String city;
  String subCity;
  String telephone;
  String mobile;
  int latitude;
  int longitude;
  int branchGrade;

  Branch(
      {this.branchCode,
        this.branchName,
        this.region,
        this.city,
        this.subCity,
        this.telephone,
        this.mobile,
        this.latitude,
        this.longitude,
        this.branchGrade});

  Branch.fromJson(Map<String, dynamic> json) {
    branchCode = json['branchCode'];
    branchName = json['branchName'];
    region = json['region'];
    city = json['city'];
    subCity = json['subCity'];
    telephone = json['telephone'];
    mobile = json['mobile'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    branchGrade = json['branchGrade'];
  }

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchCode'] = this.branchCode;
    data['branchName'] = this.branchName;
    data['region'] = this.region;
    data['city'] = this.city;
    data['subCity'] = this.subCity;
    data['telephone'] = this.telephone;
    data['mobile'] = this.mobile;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['branchGrade'] = this.branchGrade;
    return data;
  }
}
class Officer {
  String employeeId;
  String branchCode;
  String emailId;
  String mobileNumber;
  String firstName;
  String middleName;
  String lastName;
  Null privilege;
  Null userName;
  String password;
  Null corePass;

  Officer(
      {this.employeeId,
        this.branchCode,
        this.emailId,
        this.mobileNumber,
        this.firstName,
        this.middleName,
        this.lastName,
        this.privilege,
        this.userName,
        this.password,
        this.corePass});

  Officer.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    branchCode = json['branchCode'];
    emailId = json['emailId'];
    mobileNumber = json['mobileNumber'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    privilege = json['privilege'];
    userName = json['userName'];
    password = json['password'];
    corePass = json['corePass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['branchCode'] = this.branchCode;
    data['emailId'] = this.emailId;
    data['mobileNumber'] = this.mobileNumber;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['privilege'] = this.privilege;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['corePass'] = this.corePass;
    return data;
  }
}

