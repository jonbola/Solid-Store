class ProductModel {
  final int? productId;
  final String productName;
  final int categoryId;
  final double price;
  final int stockQuantity;
  final String description;
  final String img;

  const ProductModel({
    this.productId,
    required this.productName,
    required this.categoryId,
    required this.price,
    required this.stockQuantity,
    required this.description,
    required this.img,
  });

 factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
  productId: json['productId'],
  productName: json['productName'],
  categoryId: json['categoryId'],
  price: json['price'],
  stockQuantity: json['stockQuantity'],
  description: json['description'],
  img: json['img'],
);

Map<String, dynamic> toJson() => {
  'productId': productId,
  'productName': productName,
  'categoryId': categoryId,
  'price': price,
  'stockQuantity': stockQuantity,
  'description': description,
  'img': img,
};


  // Copy constructor
  ProductModel copyWith({
    int? productId,
    String? productName,
    int? categoryId,
    double? price,
    int? stockQuantity,
    String? description,
    String? img,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      description: description ?? this.description,
      img: img ?? this.img,
    );
  }

  // Method to map a list of JSON objects to a list of ProductModel instances
  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  // Method to map a list of ProductModel instances to a list of JSON objects
  static List<Map<String, dynamic>> toJsonList(List<ProductModel> products) {
    return products.map((product) => product.toJson()).toList();
  }
}
