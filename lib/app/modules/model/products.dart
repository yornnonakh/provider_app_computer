class Product {
  int id;
  String name;
  double price;
  String image;
  String description;
  String category;
  int stock;
  Specs specs;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.stock,
    required this.specs,
  });

  // Convert json -> Object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      description: json['description'],
      category: json['category'],
      stock: json['stock'],
      specs: Specs.fromJson(json['specs']),
    );
  }
}
class Specs {
  String cpu;
  String ram;
  String storage;
  String gpu;
  String display;

  Specs({
    required this.cpu,
    required this.ram,
    required this.storage,
    required this.gpu,
    required this.display,
  });

  // convert json -> object
  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      cpu: json['cpu'],
      ram: json['ram'],
      storage: json['storage'],
      gpu: json['gpu'],
      display: json['display'],
    );
  }
}
