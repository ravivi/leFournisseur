
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lefournisseur/app/models/Facture.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class CommandeController extends GetxController{

  String serverUrl = "http://devops.egaz.shop/v1/api";

  String message="";
 var token;
  var totalcredit;
  var totaldebit;
   var isLoading = false.obs;
 var status = RxInt(0);
  int nbcommandeitems=0;

     String format(DateTime date) {
   String formattedDate = DateFormat('dd/MM/yyyy').format(date);
   return formattedDate;
  }


  //enregistrer une commande
  // Future<List> storeCommande(int entrepot_id) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //  var url = Uri.parse('$serverUrl/factures');
  //   final response = await http.post(url,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       },
  //   );
  //   var data =  json.decode(response.body);
  //   status = response.statusCode;
  //   print(data);
  //   if (response.statusCode == 200) {

  //     message = data["message"];

  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }

  // }


  // //recuperation des commande de l'utilisateur
  // Future<List> getCommande() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   List<Commande> commandes = List();


  //   String myUrl = "$serverUrl/client/commande";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       });
  //   var data =  json.decode(response.body);
  //   status = response.statusCode;
  //   if (response.statusCode == 200) {
  //     commandes = (data["data"]["commandes"] as List)
  //         .map((data) => new Commande.fromJson(data))
  //         .toList();

  //     return commandes;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }

  // }

  // //recuperation des commandes livree de l'utilisateur
  // Future<List> getLivraison() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   List<Commande> commandes = List();


  //   String myUrl = "$serverUrl/client/commande/livree";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       });
  //   var data =  json.decode(response.body);
  //   status = response.statusCode;
  //   if (response.statusCode == 200) {
  //     commandes = (data["data"]["commandes"] as List)
  //         .map((data) => new Commande.fromJson(data))
  //         .toList();

  //     return commandes;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }

  // }


  /**
   * recuperation des notifications du client
   */
  Future<List> getFacture() async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    List<Facture> factures =[];
    print('jesus');
 isLoading(true);
     var url = Uri.parse('$serverUrl/factures');
    final response = await http.get(url, 
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $token'
        });
       status(response.statusCode);  
    var data =  json.decode(response.body);
    print(response.body);
 print('viens');

    if (response.statusCode == 200) {
      factures = (data["data"]["factures"] as List)
          .map((data) => new Facture.fromJson(data))
          .toList();

      return factures;
    } else {
       print('aide');
         isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }

  }

  // getCommande() {}


  // Future<List> getCommandeItems(id) async {

  //   List<CommandeItems> commandeItems= List();
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   String myUrl = serverUrl+"/client/commande/items/${id}";
  //   http.Response response = await http.get(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization' : 'Bearer $token'
  //   });
  //   var data = json.decode(response.body);
  //   print(data);
  //   if (response.statusCode == 200) {
  //     commandeItems = (data["data"]["commandeitems"] as List)
  //         .map((data) => new CommandeItems.fromJson(data))
  //         .toList();
  //     nbcommandeitems = commandeItems.length;
  //     return commandeItems;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }
  // }

  // /**
  //  *recuperation des versements(paiement relative a la commande)
  //  */
  // Future<List> getVersement() async {

  //   List<Versement> versements = List();
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   String myUrl = serverUrl+"/client/commande/versements";
  //   http.Response response = await http.get(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization' : 'Bearer $token'
  //   });
  //   var data = json.decode(response.body);
  //   print(data);
  //   if (response.statusCode == 200) {
  //     versements = (data["data"]["versements"] as List)
  //         .map((data) => new Versement.fromJson(data))
  //         .toList();
  //     totaldebit = data["data"]["totaldebit"];
  //     totalcredit = data["data"]["totalcredit"];

  //     return versements;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }
  // }



}
