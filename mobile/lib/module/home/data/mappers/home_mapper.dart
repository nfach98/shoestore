import 'package:mobile/module/home/data/models/get_shoes_response_model.dart';
import 'package:mobile/module/home/domain/entities/get_shoes_entity.dart';

class HomeMapper {
  static GetShoesEntity toGetShoesEntity(GetShoesResponseModel? model) =>
      GetShoesEntity(
        shoes: toShoesResponseEntity(model?.shoes),
      );

  static ShoesResponseEntity toShoesResponseEntity(ShoesResponseModel? model) =>
      ShoesResponseEntity(
        currentPage: model?.currentPage,
        prevPageUrl: model?.prevPageUrl,
        nextPageUrl: model?.nextPageUrl,
        data: model?.data?.map((e) => toShoesEntity(e)).toList(),
      );

  static ShoesEntity toShoesEntity(ShoesModel? model) =>
      ShoesEntity(
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
      );
}