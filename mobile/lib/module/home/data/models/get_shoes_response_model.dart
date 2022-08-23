import 'dart:collection';

class GetShoesResponseModel {
  GetShoesResponseModel({
    this.shoes,
  });

  ShoesResponseModel? shoes;

  factory GetShoesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetShoesResponseModel(
        shoes: json['shoes'] == null
            ? null
            : ShoesResponseModel.fromJson(json['shoes']),
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
        data:
            (json['data'] as List).map((v) => ShoesModel.fromJson(v)).toList(),
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
    this.colorways,
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
  List<ColorwayModel>? colorways;

  factory ShoesModel.fromJson(Map<String, dynamic> json) => ShoesModel(
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
        colorways: (json['colorways'] as List)
            .map((v) => ColorwayModel.fromJson(v))
            .toList(),
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
    map['colorways'] = colorways?.map((v) => v.toMap).toList();
    return map;
  }
}

class ColorwayModel {
  ColorwayModel({
    this.id,
    this.idShoes,
    this.style,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.sizes,
    this.images,
  });

  String? id;
  String? idShoes;
  String? style;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<SizeModel>? sizes;
  List<ImageModel>? images;

  factory ColorwayModel.fromJson(Map<String, dynamic> json) => ColorwayModel(
        id: json['id'],
        idShoes: json['id_shoes'],
        style: json['style'],
        name: json['name'],
        image: json['image'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        sizes:
            (json['sizes'] as List).map((v) => SizeModel.fromJson(v)).toList(),
        images: (json['images'] as List)
            .map((v) => ImageModel.fromJson(v))
            .toList(),
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['id'] = id;
    map['id_shoes'] = idShoes;
    map['style'] = style;
    map['name'] = name;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['sizes'] = sizes?.map((v) => v.toMap).toList();
    map['images'] = images?.map((v) => v.toMap).toList();
    return map;
  }
}

class SizeModel {
  SizeModel({
    this.id,
    this.idShoes,
    this.idColorway,
    this.size,
  });

  int? id;
  String? idShoes;
  String? idColorway;
  String? size;

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
        id: json['id'],
        idShoes: json['id_shoes'],
        idColorway: json['id_colorway'],
        size: json['size'],
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['id'] = id;
    map['id_shoes'] = idShoes;
    map['id_colorway'] = idColorway;
    map['size'] = size;
    return map;
  }
}

class ImageModel {
  ImageModel({
    this.id,
    this.idShoes,
    this.idColorway,
    this.image,
  });

  int? id;
  String? idShoes;
  String? idColorway;
  String? image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        idShoes: json['id_shoes'],
        idColorway: json['id_colorway'],
        image: json['image'],
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['id'] = id;
    map['id_shoes'] = idShoes;
    map['id_colorway'] = idColorway;
    map['image'] = image;
    return map;
  }
}
