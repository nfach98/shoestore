import 'dart:collection';

class GetShoesResponseModel {
  GetShoesResponseModel({
    this.shoes,
  });

  ShoesResponseModel? shoes;

  factory GetShoesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetShoesResponseModel(
        shoes: json['shoes'] == null
            ? null : ShoesResponseModel.fromJson(json['shoes']),
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['shoes'] = shoes?.toMap;
    return map;
  }
}

class ShoesResponseModel {
  ShoesResponseModel({
    this.currentPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.data,
  });

  int? currentPage;
  String? nextPageUrl;
  String? prevPageUrl;
  List<ShoesModel>? data;

  factory ShoesResponseModel.fromJson(Map<String, dynamic> json) =>
      ShoesResponseModel(
        currentPage: json['current_page'],
        nextPageUrl: json['next_page_url'],
        prevPageUrl: json['prev_page_url'],
        data: (json['data'] as List).map((v) => ShoesModel.fromJson(v)).toList(),
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['current_page'] = currentPage;
    map['next_page_url'] = nextPageUrl;
    map['prev_page_url'] = prevPageUrl;
    map['data'] = data?.map((v) => v.toMap).toList();
    return map;
  }
}

class ShoesModel {
  ShoesModel({
    this.id,
    this.idCategory,
    this.nameCategory,
    this.title,
    this.subtitle,
    this.price,
    this.discount,
    this.description,
    this.image,
    this.createdAt,
  });

  String? id;
  String? idCategory;
  String? nameCategory;
  String? title;
  String? subtitle;
  String? price;
  String? discount;
  String? description;
  String? image;
  String? createdAt;

  factory ShoesModel.fromJson(Map<String, dynamic> json) =>
      ShoesModel(
        id: json['id'],
        idCategory: json['id_category'],
        nameCategory: json['name_category'],
        title: json['title'],
        subtitle: json['subtitle'],
        price: json['price'],
        discount: json['discount'],
        description: json['description'],
        image: json['image'],
        createdAt: json['created_at'],
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['id'] = id;
    map['id_category'] = idCategory;
    map['name_category'] = nameCategory;
    map['title'] = title;
    map['price'] = price;
    map['discount'] = discount;
    map['description'] = description;
    map['image'] = image;
    map['created_at'] = createdAt;
    return map;
  }
}

