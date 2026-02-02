import 'package:technical_test_pragma/domain/datasources/cat_breeds_datasource.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/domain/repositories/cat_breeds_repository.dart';

class CatBreedsRepositoryImpl extends CatBreedsRepository {
  final CatBreedsDatasource catDatasource;

  CatBreedsRepositoryImpl({required this.catDatasource});

  @override
  Future<List<CatBreeds>> getListCats() {
    return catDatasource.getListCats();
  }
}
