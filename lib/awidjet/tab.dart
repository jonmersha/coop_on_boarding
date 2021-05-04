import 'package:onboarding/custom_color/custom_color.dart';
import 'package:onboarding/pages/cuatomer_account/CustomerList.dart';
import 'package:onboarding/pages/cuatomer_account/customerinfo/customer_1.dart';
import 'package:onboarding/pages/wallet/RecentTransation.dart';
import 'package:flutter/material.dart';
import '../menu/customer_menu.dart';

class Tabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DefaultTabController(
        length: 4,
        child: new Scaffold(

          body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("images/onb_back.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: TabBarView(
              children: [
                new Container(//wallet home
                    // color: CustomColor.white,
                    child: CustomerList(),
                ),
               new Container(//TRansation List
                    color: const Color(0xaa0000ff),
                    child: RecentTransaction()

               ),
               new Container(
                child: CustomerMenu(),
               ),
               new Container(
                 // color: const Color(0x00000000),
               ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColor.cyan_blue,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>CustomerCreateOne()),
              );

            },
            child: Icon(Icons.person_add_alt,color: Colors.white),
          ),
          bottomNavigationBar: Container(
             color: CustomColor.cyan_blue,//bottom tab holder bottom
            child: new TabBar(

              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
               Tab(
                 icon: new Icon(Icons.list),

               ),
               Tab(
                 icon: new Icon(Icons.group),
               ),
               Tab(icon: new Icon(Icons.shop),
               )
              ],
               labelColor: const Color(0xFF000000),
              unselectedLabelColor:  CustomColor.white,
               // indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(1.0),
              indicatorColor: CustomColor.cyan_blue,
            ),
          ),

        ),
      ),
    );
  }
}