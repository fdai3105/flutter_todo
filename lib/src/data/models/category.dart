import 'dart:convert';

class Category {
  Category({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final List<CategoryDatum> data;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        code: json["code"],
        message: json["message"],
        data: List<CategoryDatum>.from(
            json["data"].map((x) => CategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDatum {
  CategoryDatum({
    required this.id,
    required this.title,
    required this.color,
    required this.total,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String color;
  final int total;
  final int completed;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CategoryDatum.fromRawJson(String str) =>
      CategoryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["id"],
        title: json["title"],
        color: json["color"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        completed: json["completed"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "completed": completed,
        "total": total,
      };
}
