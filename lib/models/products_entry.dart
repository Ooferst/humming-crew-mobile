// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    double price;
    String thumbnail;
    int views;
    DateTime createdAt;
    bool isFeatured;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.views,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble() ?? 0.0,
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "views": views,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
