class CatBreeds {
  final String id;
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final int adaptability;
  final int intelligence;
  final String? lifeSpan;
  final int energyLevel;
  final String? wikipediaUrl;
  final String? urlImage;

  CatBreeds({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    this.lifeSpan,
    required this.energyLevel,
    this.wikipediaUrl,
    this.description = '',
    this.adaptability = 0,
    this.intelligence = 0,
    this.urlImage,
  });

  factory CatBreeds.fromJson(Map<String, dynamic> json) => CatBreeds(
    id: json["id"],
    name: json["name"],
    origin: json["origin"],
    temperament: json["temperament"],
    lifeSpan: json["life_span"],
    energyLevel: json["energy_level"],
    wikipediaUrl: json["wikipedia_url"],
    urlImage: json["reference_image_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "origin": origin,
    "temperament": temperament,
  };
}
