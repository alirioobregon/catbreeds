class CatBreeds {
  final String name;
  final String urlImage = '';

  CatBreeds({required this.name});

  factory CatBreeds.fromJson(Map<String, dynamic> json) =>
      CatBreeds(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}
