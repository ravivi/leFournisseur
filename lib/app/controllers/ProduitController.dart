
 import 'package:dio/dio.dart';
import 'package:get/get.dart';

 import 'package:http/http.dart' as http;
import 'package:lefournisseur/app/models/Produit.dart';
 import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';

 class ProduitController extends GetxController{

  RxBool isLoading = false.obs;
  RxList produits = [].obs;
  RxBool isProblem = false.obs;

     @override
  void onInit() {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
     getProductList();
    print("object");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //  Future<List<ProduitElement>> getUserProduit() async {

  //    final prefs = await SharedPreferences.getInstance();
  //    final token = prefs.get('token');

  //    isLoading(true);

  //    var url = Uri.parse("$serverUrl/products");
  //    http.Response response = await http.get(url,
  //        headers: {
  //          'Accept':'application/json',
  //          'Authorization' : 'Bearer $token'
  //        });

  //    var data =  json.decode(response.body);
  //    if (response.statusCode == 200) {
  //      print("bien");
  //      isLoading(false);
  //      print(data["data"]);
  //      return  produit((data["data"] as List)
  //          .map((data) => new ProduitElement.fromJson(data))
  //          .toList());

  //    } else {
  //      isLoading(false);
  //      throw Exception('Veuillez verifier votre connexion internet');
  //    }

  //  }

  // Future getUserProduit() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
    

  //   var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/products");
  //   http.Response response = await http.get(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization' : 'Bearer $token'
  //   });
  //   var data = json.decode(response.body);
  //   if (response.statusCode == 200) {

  //       // produits = Produit.fromJson(data["data"]["produits"]);

  //       //   for (var _data in data["data"]) {

  //       //   produits.add(Data.fromJson(_data));      
  //       // }
  //       print(data["data"]);
  //        isLoading = false.obs;

  //         print(produits);
  //   } else {
  //     print("non");
  //     return null;
  //   }
  // }



//recuperation la liste des produits

  getProductList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    

    print("ok");
  
    isLoading(true);
    isProblem(false);
    BaseOptions options = BaseOptions(
      connectTimeout: 10000,
      sendTimeout: 10000,
      baseUrl: "http://devops.egaz.shop/v1/api/products",
     headers: {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    },
      followRedirects: false,
    );
    Dio dio = new Dio(options);
    try {
    //    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/products");
    // http.Response response = await http.get(myUrl, headers: {
    //   'Accept': 'application/json',
    //   'Authorization' : 'Bearer $token'
    // });
    final response = await dio.get(
        "http://devops.egaz.shop/v1/api/products",
        
        
      );
    var data = response.data;
      print(response.statusCode);
      print(isLoading);

      if (response.statusCode == 200) {
        for (var item in data["data"]["produits"]) {
          print("Premier visuel=========> $produits");
          produits.add(Produit.fromJson(item));
          print("deuxième visuel=========> $produits");
          isLoading(false);
          isProblem(false);
        }
        print(data);
      }
      
      
       else {
        isLoading(false);
        print("Non non");
      }
    } on DioError catch (e) {
      isProblem(true);
      print("probleme ================== $isProblem+ $e");
    }
  }

 }


