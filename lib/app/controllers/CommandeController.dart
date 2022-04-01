import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lefournisseur/app/models/Commande.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CommanderController extends GetxController {
   String message="";
   String token="";
  var totalcredit;
  var totaldebit;
  var status = RxInt(0);
  var isLoading = false.obs;
  List<Commande> commande = <Commande>[].obs;

  @override
  void onInit() {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    getCommande();
    print("object");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  int nbcommandeitems = 0;

  getCommande() async {
    final prefs = await SharedPreferences.getInstance();
 
    final token = prefs.get('token');
    isLoading(true);

    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/orders");
    http.Response response = await http.get(myUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print(response.statusCode);
    print("Le bonjour");
    print(response.body);
    status(response.statusCode);
    var data = json.decode(response.body);
    status(response.statusCode);
    if (response.statusCode == 200) {
      print(data["data"]);
      data["data"]["commandes"].forEach((element) {
        commande.add(Commande.fromJson(element));
      });
      print("//////commande: ${commande.toString()}/////////");
      //  isLoading (false);
      //  commande =((data["data"] as List)
      //   .map((data) => new Commande.fromJson(data))
      //   .toList());

    } else {
      throw Exception('Veuillez verifier votre connexion internet');
    }
    update();
  }
    //enregistrer une commande

  storeCommande(int entrepotId) async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);


    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/orders/store");
    http.Response response = await http.post(myUrl, headers: {

          'Accept':'application/json',
          'Authorization' : 'Bearer $token'
        },
    );
    var data =  json.decode(response.body);
      print(response.statusCode);
    print("Le bonjour");
    print(response.body);
    status(response.statusCode);
    print(data);
    if (response.statusCode == 200) {

      message = data["message"];

    } else {
      throw Exception('Veuillez verifier votre connexion internet');
    }
 update();
  }
}
