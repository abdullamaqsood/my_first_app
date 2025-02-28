class Products {
  int? id;
  String name;
  String? image;
  // List<String>? images;
  PhysicalDescription? physicalDescription;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.physicalDescription,
    // required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      physicalDescription:
          PhysicalDescription.fromJson(json['physicalDescription']),
      // images: List<String>.from(json['images']),
    );
  }
}

class PhysicalDescription {
  String? gender;
  String? eyeColor;
  String? hairColor;

  PhysicalDescription({
    required this.gender,
    required this.eyeColor,
    required this.hairColor,
  });

  factory PhysicalDescription.fromJson(Map<String, dynamic> json) {
    return PhysicalDescription(
        gender: json['gender'],
        eyeColor: json['eyeColor'],
        hairColor: json['hairColor']);
  }
}
