// // To parse this JSON data, do
//
//     final produit = produitFromJson(jsonString);

import 'dart:convert';

Produit produitFromJson(String str) => Produit.fromJson(json.decode(str));


class Produit {
    Produit({
        required this.success,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    bool success;
    int statusCode;
    String message;
    Data data;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );


}

class Data {
    Data({
        required this.carts,
        required this.montantttc,
    });

    List<Cart> carts;
    int montantttc;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
        montantttc: json["montantttc"],
    );
}

class Cart {
    Cart({
        this.id,
        this.quantite,
        this.montant,
        this.total,
        this.type,
        this.produitId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdBy,
        this.clientId,
        this.produitName,
        this.produitPrixUnitaire,
        this.produitPrixCarton,
        this.prixDetaillant,
        this.prixSemiGrossiste,
        this.prixGrossiste,
        this.produitPhoto,
    });

    int ?id;
    int ?quantite;
    int ?montant;
    int ?total;
    String ?type;
    int ?produitId;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    dynamic deletedAt;
    String ?createdBy;
    int ?clientId;
    String ?produitName;
    dynamic produitPrixUnitaire;
    int ?produitPrixCarton;
    int ?prixDetaillant;
    int ?prixSemiGrossiste;
    int ?prixGrossiste;
    String ?produitPhoto;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        quantite: json["quantite"],
        montant: json["montant"],
        total: json["total"],
        type: json["type"],
        produitId: json["produit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        clientId: json["client_id"],
        produitName: json["produit_name"],
        produitPrixUnitaire: json["produit_prix_unitaire"],
        produitPrixCarton: json["produit_prix_carton"],
        prixDetaillant: json["prix_detaillant"],
        prixSemiGrossiste: json["prix_semi_grossiste"],
        prixGrossiste: json["prix_grossiste"],
        produitPhoto: json["produit_photo"],
    );

}
