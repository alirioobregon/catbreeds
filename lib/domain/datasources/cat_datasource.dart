import 'package:technical_test_pragma/domain/entities/cat.dart';

abstract class CatDatasource {
  Future<List<Cat>> getListCats();
}
