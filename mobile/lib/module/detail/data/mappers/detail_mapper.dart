import 'package:flutter/cupertino.dart';
import 'package:mobile/module/detail/data/models/get_shoes_detail_response_model.dart';
import 'package:mobile/module/detail/domain/entities/get_shoes_detail_entity.dart';
import 'package:mobile/module/home/data/models/get_shoes_response_model.dart';
import 'package:mobile/module/home/domain/entities/get_shoes_entity.dart';

class DetailMapper {
  static GetShoesDetailEntity toGetShoesDetailEntity(
          GetShoesDetailResponseModel? model) =>
      GetShoesDetailEntity(
        shoes: toShoesEntity(model?.shoes),
      );

  static ShoesEntity toShoesEntity(ShoesModel? model) => ShoesEntity(
    id: model?.id,
    idCategory: model?.idCategory,
    price: model?.price,
    image: model?.image,
    createdAt: model?.createdAt,
    description: model?.description,
    discount: model?.discount,
    nameCategory: model?.nameCategory,
    subtitle: model?.subtitle,
    title: model?.title,
    colorways: model?.colorways?.map((e) => toColorwayEntity(e)).toList(),
  );

  static ColorwayEntity toColorwayEntity(ColorwayModel? model) => ColorwayEntity(
    id: model?.id,
    idShoes: model?.idShoes,
    image: model?.image,
    name: model?.name,
    style: model?.style,
    createdAt: model?.createdAt,
    updatedAt: model?.updatedAt,
    images: model?.images?.map((e) => toImageEntity(e)).toList(),
    sizes: model?.sizes?.map((e) => toSizeEntity(e)).toList(),
  );

  static ImageEntity toImageEntity(ImageModel? model) => ImageEntity(
    id: model?.id,
    idColorway: model?.idColorway,
    idShoes: model?.idShoes,
    image: model?.image,
  );

  static SizeEntity toSizeEntity(SizeModel? model) => SizeEntity(
    id: model?.id,
    idColorway: model?.idColorway,
    idShoes: model?.idShoes,
    size: model?.size,
  );
}
