import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CatBreedsResponse {
  final String id;
  final String name;
  final String origin;

  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  CatBreedsResponse({
    required this.id,
    required this.name,
    required this.origin,
    this.referenceImageId,
  });

  factory CatBreedsResponse.fromJson(Map<String, dynamic> json) =>
      CatBreedsResponse(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        referenceImageId: json["referenceImageId"],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "origin": origin};
}
