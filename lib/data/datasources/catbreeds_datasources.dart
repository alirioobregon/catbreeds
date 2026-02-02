import 'package:dio/dio.dart';
import 'package:technical_test_pragma/domain/datasources/cat_datasource.dart';
import 'package:technical_test_pragma/domain/entities/cat.dart';

class CatbreedsDatasources extends CatDatasource {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.thecatapi.com/v1/'));

  @override
  Future<List<Cat>> getListCats() async {
    final response = await dio.get('breeds');

    print(response.toString());

    return [];
  }
}
