// class Facture {
//   final  id;
//   final  reference;
//   final  reference_commande;
//   final  monantttc;
//   final  montantht;
//   final  avance;
//   final  reste;
//   final  statut;
//   final  type;
//   final  date;


//   Facture._(
//       {this.id,
//         this.reference,
//         this.reference_commande,
//         this.monantttc,
//         this.montantht,
//         this.statut,
//         this.avance,
//         this.reste,
//         this.type,
//         this.date
//       });

//   factory Facture.fromJson(Map<String, dynamic> json) {
//     return Facture._(
//       id: json['id'],
//       reference: json['reference'],
//       reference_commande: json['reference_commande'],
//       montantht: json['montantht'],
//       monantttc: json['montantttc'],
//       avance: json['avance'],
//       reste: json['reste'],
//       statut: json['statut'],
//       type: json['type'],
//       date: json['created_at'],
//     );
//   }
// }




// To parse this JSON data, do
//
//     final produit = produitFromJson(jsonString);

import 'dart:convert';

Produit produitFromJson(String str) => Produit.fromJson(json.decode(str));


class Produit {
    Produit({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool ?success;
    int ?statusCode;
    String ?message;
    Data ?data;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );
}

class Data {
    Data({
        required this.factures,
    });

    List<Facture> factures;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        factures: List<Facture>.from(json["factures"].map((x) => Facture.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "factures": List<dynamic>.from(factures.map((x) => x.toJson())),
    };
}

class Facture {
    Facture({
        required this.id,
        required this.reference,
        required this.montantttc,
        required this.montantht,
        required this.avance,
        required this.reste,
        required this.reduction,
        required this.type,
        required this.commandeId,
        required this.statut,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
    });

    int id;
    String reference;
    int montantttc;
    int montantht;
    int avance;
    int reste;
    int reduction;
    String type;
    int commandeId;
    int statut;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Facture.fromJson(Map<String, dynamic> json) => Facture(
        id: json["id"],
        reference: json["reference"],
        montantttc: json["montantttc"],
        montantht: json["montantht"],
        avance: json["avance"],
        reste: json["reste"],
        reduction: json["reduction"],
        type: json["type"],
        commandeId: json["commande_id"],
        statut: json["statut"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "montantttc": montantttc,
        "montantht": montantht,
        "avance": avance,
        "reste": reste,
        "reduction": reduction,
        "type": type,
        "commande_id": commandeId,
        "statut": statut,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
