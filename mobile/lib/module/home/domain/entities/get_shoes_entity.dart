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
}

