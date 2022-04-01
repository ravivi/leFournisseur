import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dart:convert';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lefournisseur/app/controllers/CartController.dart';
import 'package:lefournisseur/app/controllers/ProduitController.dart';
import 'package:lefournisseur/app/models/Produit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lefournisseur/app/routes/app_pages.dart';
import 'package:lefournisseur/app/widgets/badge.dart';
import '../controllers/productlist_controller.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  // final CartController _cartController = Get.put(CartController());
  bool _isLoading = false;

  List<Produit> products = [];
  final ProductlistController _produitController =
      Get.put(ProductlistController());
  List result = [];
  Future getArticleList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    RxBool isLoading = true.obs;

    var myUrl = Uri.parse("https://devops.egaz.shop/v1/api/products");
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      isLoading(false);

      print("bien");
      setState(() {
        result = data["data"]["produits"];
      });
      print(result);

      return result;
    } else {
      print("non");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getArticleList();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Liste des produits",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)
                ),
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
      body: Obx(
        () => (_produitController.isProblem.value)
            ? Container(
                height: Get.height,
                width: Get.width,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Icon(
                      Icons.wifi,
                      color: Colors.grey,
                      size: 100.h,
                    ),
                    Text(
                      "Pas de connexion à internet",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Un problème est survenu.",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // print("object");

                        _produitController.getProductList();
                      },
                      child: Container(
                        width: 250.w,
                        height: 45.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Réessayer",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : LoadingOverlay(
                isLoading: _produitController.isLoading.value,
                color: Colors.white,
                opacity: 0.5,
                progressIndicator: CircularProgressIndicator(),
                child: GridView.builder(
                    //shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: _produitController.produits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(18.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCTDETAIL,
                                        arguments:
                                            _produitController.produits[index]);
                                  },
                                  child: (_produitController
                                              .produits[index].photo==null)?Image.asset("assets/images/Logo-founisseur.png"):Container(
                                    width: Get.width,
                                    height: Get.height / 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(_produitController
                                              .produits[index].photo),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black54,
                                              BlendMode.darken)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _produitController.produits[index].libelle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Prix : ${_produitController.produits[index].prixCarton} Fcfa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    // _cartController
                                    //     .addProductInCart(1, products[index].id)
                                    //     .whenComplete(() {
                                    //   if (_cartController.status == 200) {
                                    //     setState(() {
                                    //       _isLoading = false;
                                    //       print("oui oui");
                                    //     });
                                    //     AwesomeDialog(
                                    //         context: context,
                                    //         animType: AnimType.BOTTOMSLIDE,
                                    //         dialogType: DialogType.SUCCES,
                                    //         body: Center(
                                    //           child: Text(
                                    //               '${products[index].libelle}  ajouté au panier avec succès',
                                    //               style: TextStyle(fontSize: 12)),
                                    //         ),
                                    //         title: 'Panier',
                                    //         btnOkOnPress: () {},
                                    //         btnCancelOnPress: () {},
                                    //         btnCancelText: 'Fermer',
                                    //         btnOkText: 'Panier')
                                    //       ..show();
                                    //   } else {
                                    //     setState(() {
                                    //       _isLoading = false;
                                    //       print("oui non");
                                    //     });

                                    //     Get.snackbar(
                                    //       'Erreur',
                                    //       _cartController.message,
                                    //       snackPosition: SnackPosition.TOP,
                                    //       backgroundColor: Colors.green,
                                    //       colorText: Colors.white,
                                    //       isDismissible: false,
                                    //     );
                                    //   }
                                    // });
                                  },
                                  child: Row(children: [
                                    Icon(Icons.shopping_cart_outlined,
                                        color: Color(0xffc2151c), size: 16.0),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Ajouter au panier',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xffc2151c),
                                            fontSize: 12.0.sp))
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.HOME);
        },
        backgroundColor: Color(0xffC71617),
        child: Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomBar(),
    );
  }
}
