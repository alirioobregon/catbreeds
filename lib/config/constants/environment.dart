import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

class Environment {
  static String apiKey = dotenv.env['apikey'] ?? 'No hay api key';
  static String noImageUrl = 'Url not found';
  static List<CatBreeds> catBreedsList = [];
}
