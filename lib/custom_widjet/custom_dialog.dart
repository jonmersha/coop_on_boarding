import 'package:flutter/material.dart';


class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   // return Container();
  }
  void dialogMessage(String message, BuildContext context){
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(
                  color: const Color(0x00000000)

              )
          ),

          content:Container(

            child: Wrap(

              children: <Widget>[

                Center(
                  child: Column(
                    children: <Widget>[
                      Text('!',style: TextStyle(
                          fontSize: 60,
                          color: Colors.red
                      ),),
                      Text(message,style: TextStyle(
                        color: Colors.black
                      ),),
                    ],
                  ),
                ),

              ],
            ),

          ),

          actions: <Widget>[FlatButton(
            color: const Color(0xFF000000),

        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
        side: BorderSide(color: const Color(0xFFFFFFFF)

        )
        ),

            child: Text('Ok'),
            onPressed: ()=>{ Navigator.pop(context)},)],
        );
      },
    );
  }
  void dialogMessageConfirm(String message, BuildContext context){
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xCCFFFFFF),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(
                  color: const Color(0xFF000000)

              )
          ),

          content:Container(

            child: Wrap(

              children: <Widget>[

                Center(
                  child: Column(
                    children: <Widget>[
                      Text('!',style: TextStyle(
                          fontSize: 60,
                          color: Colors.black
                      ),),
                      Text(message,style: TextStyle(
                        color: Colors.black
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[FlatButton(
            color: const Color(0xFF000000),

        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
        side: BorderSide(color: const Color(0xFFFFFFFF)

        )
        ),

            child: Text('Ok'),
            onPressed: ()=>{ Navigator.pop(context)},)],
        );
      },
    );
  }
}



