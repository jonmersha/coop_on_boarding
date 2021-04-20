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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/onb_back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: TabBarView(

              children: [
                new Container(//wallet home
                    // color: CustomColor.white,
                    child: CustomerMenu(controller: null,)
                ),
               new Container(//TRansation List
                   // color: const Color(0x00000000),
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
          bottomNavigationBar: Container(
             color: const Color(0xff00aeef),//bottom tab holder bottom
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
              labelColor: const Color(0xFFffffff),
              unselectedLabelColor: const Color(0xFF000000),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(1.0),
              indicatorColor: const Color(0xFF000000),
            ),
          ),

        ),
      ),
    );
  }
}