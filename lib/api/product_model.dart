class Products {
  int? id;
  String title;
  String? description;
  List<String>? images;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }
}
