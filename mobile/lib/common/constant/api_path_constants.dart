class ApiPathConstants {
  ApiPathConstants._();

  static const String baseUrl = 'https://shoestore.ninofachrurozy.com/';
  static const String baseApiUrl = '${baseUrl}api';

  static String getShoes({int? page}) {
    return page == null
      ? '/shoes'
      : '/shoes?page=$page';
  }
}