import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lefournisseur/app/modules/login/controllers/login_controller.dart';
import 'package:lefournisseur/app/modules/profil/controllers/profil_controller.dart';
import 'package:lefournisseur/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerPage();
  }
}

class _DrawerPage extends State<DrawerPage> {
  // AuthController databaseHelper = new AuthController();
  final ProfilController _profilController = Get.put(ProfilController());
  bool _isLoading = false;

  String email = '';
  String name = '';
  String telephone = '';
  String type = '';
  String avatar = '';
  String code = '';
  var date = DateTime.now();

  // getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = prefs.get('userFirstname')+' '+prefs.get('userLastname');
  //     email = prefs.get('userEmail');
  //     avatar = prefs.get('userAvatar');
  //     telephone = prefs.get('userTelephone');
  //     type = prefs.get('userType');
  //     code = prefs.get('userCode');
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();
  }

  final LoginController _authController = Get.put(LoginController());

  logout() {
    _authController.logout();
    Get.offAllNamed(Routes.LOGIN);
Get.snackbar(
            'Deconnexion',
            "A bientôt, vous venez de vous deconnectés",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            isDismissible: false,
           
          );

  
  
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Center(
            child: Container(
              height: 250,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'profilclient');
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                              image:  NetworkImage(
                                  _profilController.user.value.photo.toString()),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                    ),
                    Text(
                        "${_profilController.user.value.firstname} ${_profilController.user.value.lastname}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                    Text('${_profilController.user.value.telephone}',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                    Text('${_profilController.user.value.code}',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffc2151c),
                            fontWeight: FontWeight.bold)),
                    Text('Particulier',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffc2151c),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Tableau de bord',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Home');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Bon de commande',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Commande');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Enregister commande',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Checkout');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Mes factures',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Facture');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Liste de produits',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'produit');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.notifications),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Notification');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Déconnexion',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.WARNING,
                  title: 'Déconnexion',
                  desc: 'Voulez-vous vraiment vous déconnectez ?',
                  btnCancelText: 'Non',
                  btnOkText: 'Oui',
                  btnOkOnPress: () {
                    logout();
                  },
                  btnCancelOnPress: () {})
                ..show();
            },
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 100,
          ),
          ListTile(
            title: Column(
              children: [
                // Text(
                //   "Version ${_packageInfo.version}",
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontFamily: 'Montserrat',
                //       color: Colors.grey[400]),
                // ),
                Text(
                  "Copyright © ${date.year} Tinitz \n Tous droits réservés",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
