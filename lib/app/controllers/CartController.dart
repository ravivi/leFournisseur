
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lefournisseur/app/models/Cart.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class CartController extends GetxController {

String serverUrl = "http://devops.egaz.shop/v1/api";

  String message="";
 var token;
  var totalcredit;
  var totaldebit;
   var isLoading = false.obs;
 var status = RxInt(0);
   var montantttc;
     RxList carts = [].obs;
  int nbcommandeitems=0;
     @override
  void onInit() {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(" Panier  ==================> $carts");
    getCart();
    print(" Panier  ==================> $carts");

    print("object");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
     String format(DateTime date) {
   String formattedDate = DateFormat('dd/MM/yyyy').format(date);
   return formattedDate;
  }




  /**
   * recuperation du panier de l'utilisateur
   */
  Future<List> getCart() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');


       var url = Uri.parse('$serverUrl/carts');
       isLoading(true);
    final response = await http.get(url, 
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $token'
        });
    var data =  json.decode(response.body);
    print(data);
          

    if (response.statusCode == 200) {

      for (var item in data["data"]["carts"]) {
          print("Premier visuel $carts");
          carts.add(Cart.fromJson(item));
          print("deuxième visuel $carts");
          isLoading(false);
          // isProblem(false);
        }
      // carts = (data["data"]["carts"])
      //     .map((data) => new Cart.fromJson(data))
      //     .toList();
           montantttc = data["data"]["montantttc"];
      return carts;
    } else {
      throw Exception('Veuillez verifier votre connexion internet');
    }
 update();
  }

    void incrementCounter(int quantity) {
    quantity++;
    update();
  }

  void decrementCounter(int quantity) {
    if (quantity != 0) {
      quantity--;
      update();
    }
    update();
  }
  /**
   * Suppression d'un produit du panier
   */
  deleteProductInCart(int id) async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

     var url = Uri.parse('$serverUrl/carts/product/delete/$id');
    final response = await http.get(url, 
      headers: {
        'Accept':'application/json',
        'Authorization' : 'Bearer $token'
      },);
    print(response.statusCode);
    print(response.body);
    status(response.statusCode);
    var data = json.decode(response.body);
    status(response.statusCode);


    message = data["message"];
    if(response.statusCode == 200){

      carts = (data["data"]["carts"])
          .map((data) => new Cart.fromJson(data))
          .toList();

      montantttc = data["data"]["montantttc"];
      return carts;
    }else {
      throw Exception();
    }
 update();
  }

  // /**
  //  * Modification de la quantite d'un produit dans le panier
  //  */
  updateProductInCart(int cart_id,int quantite,int produit_id,) async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');


     var url = Uri.parse('$serverUrl/carts/update');
    final response = await http.post(url, 
      headers: {
        'Accept':'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: {
        "cart_id": cart_id.toString(),
        "quantite": quantite.toString(),
        "produit_id": produit_id.toString(),
        //"type":type,
      }
    );
     status(response.statusCode);
    var data = json.decode(response.body);


    message = data["message"];
    print(data);
    if(status == 200){
      carts = (data["data"]["carts"])
          .map((data) => new Cart.fromJson(data))
          .toList();

      montantttc = data["data"]["montantttc"];
      return carts;
    }else {
      throw Exception();
    }
     update();

  }


  // /**
  //  * Ajout du produit dans le panier
  //  */
  addProductInCart(int produit_id,int quantite) async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

   var url = Uri.parse('$serverUrl/carts/store');
    final response = await http.post(url, 
      headers: {
        'Accept':'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: {
        "quantite":"$quantite",
        "produit_id":" $produit_id",
      }
    );
     status(response.statusCode);
    var data = json.decode(response.body);
    print(response.body);
    print("on y va");
    print(response.statusCode);
    message = data["message"];
    print(data);
    if(response.statusCode == 200){

    }else {
      throw Exception();
    }
 update();
  }



}
