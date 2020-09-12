// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryResponse> categoryResponseFromJson(String str) => List<CategoryResponse>.from(json.decode(str).map((x) => CategoryResponse.fromJson(x)));

String categoryResponseToJson(List<CategoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponse {
  CategoryResponse({
    this.categoryId,
    this.categoryName,
    this.iconPath,
    this.position,
  });

  String categoryId;
  String categoryName;
  String iconPath;
  String position;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    categoryId: json["category_id"] == null ? null : json["category_id"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
    iconPath: json["icon_path"] == null ? null : json["icon_path"],
    position: json["position"] == null ? null : json["position"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId == null ? null : categoryId,
    "category_name": categoryName == null ? null : categoryName,
    "icon_path": iconPath == null ? null : iconPath,
    "position": position == null ? null : position,
  };
}
