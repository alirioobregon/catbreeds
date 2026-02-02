import 'package:dio/dio.dart';
import 'package:technical_test_pragma/data/mappers/cat_breeds_mapper.dart';
import 'package:technical_test_pragma/data/models/cat_breeds_response.dart';
import 'package:technical_test_pragma/domain/datasources/cat_breeds_datasource.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

class CatBreedsDatasources extends CatBreedsDatasource {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.thecatapi.com/v1/'));

  @override
  Future<List<CatBreeds>> getListCats() async {
    final response = await dio.get('breeds');
    final data = response.data;

    final list = List<CatBreedsResponse>.from(
      data.map((x) => CatBreedsResponse.fromJson(x)),
    );

    final List<CatBreeds> cats = list
        .map(
          (catsBreedsResponse) =>
              CatBreedsMapper.catToEntity(catsBreedsResponse),
        )
        .toList();

    // print(cats.toString());

    return cats;
  }
}
