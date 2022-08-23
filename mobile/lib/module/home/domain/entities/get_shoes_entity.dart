class GetShoesEntity {
  GetShoesEntity({
    this.shoes,
  });

  ShoesResponseEntity? shoes;
}

class ShoesResponseEntity {
  ShoesResponseEntity({
    this.currentPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.data,
  });

  int? currentPage;
  String? nextPageUrl;
  String? prevPageUrl;
  List<ShoesEntity>? data;
}

class ShoesEntity {
  ShoesEntity({
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
  List<ColorwayEntity>? colorways;
}

class ColorwayEntity {
  ColorwayEntity({
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
  List<SizeEntity>? sizes;
  List<ImageEntity>? images;
}

class SizeEntity {
  SizeEntity({
    this.id,
    this.idShoes,
    this.idColorway,
    this.size,
  });

  int? id;
  String? idShoes;
  String? idColorway;
  String? size;
}

class ImageEntity {
  ImageEntity({
    this.id,
    this.idShoes,
    this.idColorway,
    this.image,
  });

  int? id;
  String? idShoes;
  String? idColorway;
  String? image;
}