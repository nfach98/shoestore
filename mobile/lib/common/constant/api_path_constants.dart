class ApiPathConstants {
  ApiPathConstants._();

  static const String baseUrl = "https://shoestore.ninofachrurozy.com/api";
  static String getShoes({int? page}) {
    return page == null
      ? '/shoes'
      : '/shoes?page=$page';
  }
}