class Product {
  String id;
  String name;
  int price;
  String category;
  String barcode;
  String description;
  int stock;
  String? imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.barcode,
    required this.description,
    required this.stock,
    this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'category': category,
        'barcode': barcode,
        'description': description,
        'stock': stock,
        'imagePath': imagePath,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        category: json['category'],
        barcode: json['barcode'],
        description: json['description'],
        stock: json['stock'],
        imagePath: json['imagePath'],
      );
}
