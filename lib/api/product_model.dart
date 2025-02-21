class Products {
  int? id;
  String name;
  String? image;
  // List<String>? images;

  Products({
    required this.id,
    required this.name,
    required this.image,
    // required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      // images: List<String>.from(json['images']),
    );
  }
}
