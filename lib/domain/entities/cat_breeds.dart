class CatBreeds {
  final String name;
  final String? urlImage;

  CatBreeds({required this.name, this.urlImage});

  factory CatBreeds.fromJson(Map<String, dynamic> json) =>
      CatBreeds(name: json["name"], urlImage: '');

  Map<String, dynamic> toJson() => {"name": name};
}
