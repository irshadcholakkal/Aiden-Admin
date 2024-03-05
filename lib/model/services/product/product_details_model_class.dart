class ProductData {
  String productName;
  String productDescription;
  int productPrice;
 // String imageUrl;
  String productId;

  ProductData({
    required this.productDescription,
    required this.productPrice,
    required this.productName,
   // required this.imageUrl,
    required this.productId,

  });
   factory  ProductData.fromJson(Map<String, dynamic> json) {
    return  ProductData(
      productId: json['id'],
      productName: json['name'],
      productDescription: json['brand'] ,
      productPrice: json['price'],
    );
  }
}
