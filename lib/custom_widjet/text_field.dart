
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CustomEditText extends StatelessWidget {
  var  controller=TextEditingController();
  String hintText;
  Colors mainColor;
  Colors hintColor;

  CustomEditText(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: TextFormField(
          //obscureText: true,
            cursorColor: CustomColor.white,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
            ),
            controller: controller,
            // inputFormatters: [LengthLimitingTextInputFormatter(4),],
            //keyboardType:TextInputType.text,
            decoration: new InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              icon: Icon(Icons.person,color: Colors.white),
              labelText: hintText,
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: new BorderSide(color: Colors.white)
              ),
            )

        ),

      );

  }
}
class UserInputTextField extends StatelessWidget {
  var  controller=TextEditingController();
  String hintText;
  Colors mainColor;
  Colors hintColor;
  UserInputTextField(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 50.0,
          padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: TextFormField(
          //obscureText: true,
            cursorColor: CustomColor.white,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
            ),
            controller: controller,
            // inputFormatters: [LengthLimitingTextInputFormatter(4),],
            //keyboardType:TextInputType.text,
            decoration: new InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.black),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.amber),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.black),
              ),
              // icon: Icon(Icons.account_box,color: Colors.black),
              labelText: hintText,
              labelStyle: TextStyle(color: Colors.black),


              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: new BorderSide(color: Colors.black)
              ),
            )

        ),

      );

  }
}
class EditTextForSingUp extends StatelessWidget {
  var  controller=TextEditingController();
  String hintText;
  Colors mainColor;
  Colors hintColor;

  EditTextForSingUp(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        child: TextFormField(
          //obscureText: true,
            cursorColor: CustomColor.white,
            style: TextStyle(
                color: Colors.cyan,
                //fontSize: 16.0
            ),
            controller: controller,
            // inputFormatters: [LengthLimitingTextInputFormatter(4),],
            //keyboardType:TextInputType.text,
            decoration: new InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.cyan),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.cyan),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.cyan),
              ),

              labelText: hintText,
              labelStyle: TextStyle(color: Colors.cyan),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: new BorderSide(color: Colors.cyan)
              ),
            )

        ),

      );

  }
}
class CustomEditTextPassword extends StatelessWidget {

  var  controller=TextEditingController();
  String hintText;
  CustomEditTextPassword(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: TextFormField(
            obscureText: true,
            cursorColor: CustomColor.white,
            style: TextStyle(
                color: Colors.cyan,
                fontSize: 16.0
            ),
            controller: controller,
            //inputFormatters: [LengthLimitingTextInputFormatter(4),],
            keyboardType:TextInputType.text,
            decoration: new InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              icon: Icon(Icons.lock,color: Colors.white),
              labelText: hintText,
              labelStyle: TextStyle(color: Colors.white),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: new BorderSide(color: Colors.white)
              ),
            )

        ),

      );



  }


}
class CustomEditTextPasswordSignUp extends StatefulWidget {

  var  controller=TextEditingController();
  String hintText;
  CustomEditTextPasswordSignUp(this.controller,this.hintText);

  @override
  _CustomEditTextPasswordSignUpState createState() => _CustomEditTextPasswordSignUpState();
}
class _CustomEditTextPasswordSignUpState extends State<CustomEditTextPasswordSignUp> {
  bool isHidden;

  @override
  Widget build(BuildContext context) {
    this.isHidden=true;
    return
      Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: TextFormField(
            obscureText: isHidden,
            cursorColor: CustomColor.white,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
            ),
            controller: widget.controller,
            //inputFormatters: [LengthLimitingTextInputFormatter(4),],
            keyboardType:TextInputType.text,
            decoration: new InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.white),
              ),
              icon: Icon(Icons.lock,color: Colors.white),
              labelText: widget.hintText,
              labelStyle: TextStyle(color: Colors.white),
              suffix: InkWell(
                onTap: toddlePass,
                child: Icon(
                  isHidden
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: new BorderSide(color: Colors.white)
              ),
            )

        ),

      );



  }



  void toddlePass() {
         setState(() {
      isHidden = false;
    });

  }
}


