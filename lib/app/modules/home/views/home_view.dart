import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lefournisseur/app/routes/app_pages.dart';
import 'package:lefournisseur/app/widgets/badge.dart';
import 'package:lefournisseur/app/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var solde;

  // var solde;
  // var nbcommande;
  // var nblivraison;
  // AuthController _authController = AuthController();
  // getData() async {
  //   _authController.getUserData().whenComplete(() =>
  //       setState((){
  //         solde = _authController.solde;
  //         nbcommande = _authController.nbcommande;
  //         nblivraison = _authController.nblivraison;
  //       })

  //   );
  // }

  // AuthController databaseHelper = new AuthController();

  // String avatar = "";
  // getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     avatar = prefs.get('userAvatar');
  //   });
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  //   getUserData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Tableau de bord'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xffc2151c),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Badge(child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined),
                ), value: "0", color: Colors.green,)
          )
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
           Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 2.0, color: Colors.grey)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                            child: Text(
                              'Solde due',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                            child: Text(
                              '12000600FCFA',
                              style: TextStyle(
                                  color: Color(0xff14427D),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.pushNamed(context, 'Checkout');
                            // final prefs = await SharedPreferences.getInstance();
                            // final token = prefs.get('token');
                            // print(token);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text('Passer une commande',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Color(0xffa61019))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 40.0),
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              children: <Widget>[
                _buildCard(
                    'Faire mes achats' '',
                    'Tom',
                    'Faire mes achats',
                    'assets/images/order.png',
                    Routes.PRODUCTLIST),
                _buildCard('Mes Factures', 'Tom', 'Mes factures',
                    'assets/images/billing.png', 'Facture'),
                _buildCard(
                    'Mes livraisons',
                    'Tom',
                    'Consulter vos bons de livraison',
                    'assets/images/shipping.png',
                    'Livraison'),
                _buildCard('Mon relevé ', 'Tom', 'Historique des transactions',
                    'assets/images/invoice.png', 'Versement'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.HOME);
        },
        backgroundColor: Color(0xFFa61019),
        child: Icon(Icons.dashboard, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCard(
      String title, String name, String description, String image, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, url);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 90,
              ),
              SizedBox(height: 8.0),
              Text(
                '',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                description,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                    color: Colors.grey),
              ),
              SizedBox(height: 15.0),
              Expanded(
                  child: Container(
                      width: 175.0,
                      decoration: BoxDecoration(
                        color: Color(0xffa61019),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Montserrat'),
                        ),
                      )))
            ],
          ),
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)),
    );
  }
}
