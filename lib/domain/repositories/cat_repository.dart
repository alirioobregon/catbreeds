import 'package:technical_test_pragma/domain/entities/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> getListCats();
}
