
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_1.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_3.dart';
import 'package:onboarding/pages/cuatomer_account/picture.dart';

import 'package:onboarding/pages/wallet/custom_controls/Card.dart';

import 'package:flutter/material.dart';
import '../CommonDate.dart';

class CustomerMenu extends StatelessWidget {
  const CustomerMenu({
    Key key,
    @required this.controller,
  }) : super(key: key);
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {


    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(

          childAspectRatio:(1),
          shrinkWrap: true,
          crossAxisSpacing:8,
          mainAxisSpacing: 8,
          crossAxisCount: orientation == Orientation.portrait ? 2: 4, children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(CommonData.padding),
            child: CustomCard(CustomerCreateOne(),"Create Customer", "Various Reports",Colors.black,Colors.white,
                Icon(Icons.featured_play_list),CommonData.iconSize),
          ),


          Padding(
            padding: const EdgeInsets.all(CommonData.padding),
            child: CustomCard(MyApp(),"upload", "Select Image from",Colors.black,Colors.white,
                Icon(Icons.featured_play_list),CommonData.iconSize),
          ),


        ],);
      },
    );


  }
}