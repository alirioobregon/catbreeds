import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test_pragma/data/datasources/cat_breeds_datasources.dart';
import 'package:technical_test_pragma/data/repositories/cat_breeds_repository_impl.dart';

final catRepositoryProvider = Provider((ref) {
  return CatBreedsRepositoryImpl(catDatasource: CatBreedsDatasources());
});
