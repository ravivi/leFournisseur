import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lefournisseur/app/widgets/badge.dart';
import '../controllers/productdetail_controller.dart';

class ProductdetailView extends StatelessWidget {
  var product = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(product.photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        title: Text("${product.libelle}",
            style: TextStyle(
              fontSize: 14.sp,
            )),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.all(8),
              child: Badge(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                value: "0",
                color: Colors.green,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.45,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/beer.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.libelle}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Prix du carton: ${product.prixCarton} Fcfa",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Code du produit: ${product.code}",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Code du produit: ${product.stockAlert}",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Disponible jusqu'au: ${product.dateExpiration}",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, shape: StadiumBorder()),
                        child: const Text("Ajouter à la commande"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
