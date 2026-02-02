import 'package:technical_test_pragma/data/models/cat_breeds_response.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

class CatBreedsMapper {
  static CatBreeds catToEntity(CatBreedsResponse catsBreedsResponse) =>
      CatBreeds(name: catsBreedsResponse.name);
}
