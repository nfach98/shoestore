import 'package:shoestore_mobile/layer/domain/entity/category.dart';

class CategoryModel extends Category {
  final String? id;
  final String? name;

  CategoryModel({
    this.id,
    this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id : json['id'],
      name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : this.id,
      'name' : this.name,
    };
  }
}