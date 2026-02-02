class Cat {
  final String breed;

  Cat({required this.breed});

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(breed: json["breed"]);

  Map<String, dynamic> toJson() => {"breed": breed};
}
