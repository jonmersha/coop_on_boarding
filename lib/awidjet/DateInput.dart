import 'package:flutter/material.dart';
import 'package:onboarding/custom_color/custom_color.dart';

class DateInput extends StatelessWidget {
  var  year=TextEditingController();
  var  month=TextEditingController();
  var  date=TextEditingController();

  Colors mainColor;
  Colors hintColor;
  DateInput(this.year,this.month,this.date);
  @override
  Widget build(BuildContext context) {
    return
      Container(

        height: 50.0,
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.black45),

          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                    cursorColor: CustomColor.white,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                    ),
                    controller: year,
                    // inputFormatters: [LengthLimitingTextInputFormatter(4),],
                    keyboardType:TextInputType.text,

                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: CustomColor.white),

                      ),

                      // icon: Icon(Icons.account_box,color: Colors.black),
                      labelText: 'Year',
                      labelStyle: TextStyle(color: CustomColor.white),


                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: new BorderSide(color: CustomColor.white)
                      ),
                    )


                ),
              ),
              Expanded(
                child: TextFormField(
                    cursorColor: CustomColor.white,

                    style: TextStyle(

                        color: Colors.white,
                        fontSize: 16.0
                    ),
                    controller: month,
                    // inputFormatters: [LengthLimitingTextInputFormatter(4),],
                    keyboardType:TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: CustomColor.white),

                      ),

                      // icon: Icon(Icons.account_box,color: Colors.black),
                      labelText: 'Month',
                      labelStyle: TextStyle(color: CustomColor.white),


                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: new BorderSide(color: CustomColor.white)
                      ),
                    )


                ),
              ),
              Expanded(
                child: TextFormField(
                    cursorColor: CustomColor.white,

                    style: TextStyle(

                        color: Colors.white,
                        fontSize: 16.0
                    ),
                    controller: date,
                    // inputFormatters: [LengthLimitingTextInputFormatter(4),],
                    keyboardType:TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.amber),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: CustomColor.white),

                      ),

                      // icon: Icon(Icons.account_box,color: Colors.black),
                      labelText: 'Date',
                      labelStyle: TextStyle(color: CustomColor.white),


                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: new BorderSide(color: CustomColor.white)
                      ),
                    )


                ),
              ),
            ],
          ),
        ),

      );

  }
}