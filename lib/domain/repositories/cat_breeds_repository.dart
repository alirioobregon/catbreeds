import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreeds>> getListCats();
}
