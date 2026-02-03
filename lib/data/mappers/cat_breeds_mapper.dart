import 'package:technical_test_pragma/data/models/cat_breeds_response.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

class CatBreedsMapper {
  static CatBreeds catToEntity(
    CatBreedsResponse catsBreedsResponse,
  ) => CatBreeds(
    id: catsBreedsResponse.id,
    name: catsBreedsResponse.name,
    urlImage:
        'https://cdn2.thecatapi.com/images/${catsBreedsResponse.referenceImageId}.jpg',
    origin: catsBreedsResponse.origin,
    temperament: catsBreedsResponse.temperament,
    description: catsBreedsResponse.description,
    adaptability: catsBreedsResponse.adaptability,
    intelligence: catsBreedsResponse.intelligence,
    lifeSpan: catsBreedsResponse.lifeSpan,
    energyLevel: catsBreedsResponse.energyLevel,
    wikipediaUrl: catsBreedsResponse.wikipediaUrl,
  );
}
