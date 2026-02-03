import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CatBreedsResponse {
  final String id;
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final int adaptability;
  final int intelligence;

  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  @JsonKey(name: 'energy_level')
  final int energyLevel;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  CatBreedsResponse({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.energyLevel,
    this.lifeSpan,
    this.wikipediaUrl,
    this.description = '',
    this.adaptability = 0,
    this.intelligence = 0,
    this.referenceImageId,
  });

  factory CatBreedsResponse.fromJson(Map<String, dynamic> json) =>
      CatBreedsResponse(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        temperament: json["temperament"],
        lifeSpan: json["life_span"],
        energyLevel: json["energy_level"],
        wikipediaUrl: json["wikipedia_url"],
        description: json["description"] ?? '',
        adaptability: json["adaptability"] ?? 0,
        intelligence: json["intelligence"] ?? 0,
        referenceImageId: json["reference_image_id"],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "origin": origin};
}
