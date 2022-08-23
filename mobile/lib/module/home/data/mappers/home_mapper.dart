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

  static ColorwayEntity toColorwayEntity(ColorwayModel? model) =>
      ColorwayEntity(
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
