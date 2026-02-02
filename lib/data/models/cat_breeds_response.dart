class CatBreedsResponse {
  final String id;
  final String name;
  final String origin;

  CatBreedsResponse({
    required this.id,
    required this.name,
    required this.origin,
  });

  factory CatBreedsResponse.fromJson(Map<String, dynamic> json) =>
      CatBreedsResponse(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "origin": origin};
}
