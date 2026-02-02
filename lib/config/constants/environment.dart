import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.env['apikey'] ?? 'No hay api key';
  static String noImageUrl = 'Url not found';
}
