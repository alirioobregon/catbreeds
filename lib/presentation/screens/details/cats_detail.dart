import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';

class CatsDetail extends StatelessWidget {
  final String id;

  const CatsDetail({super.key, required this.id});

  static const name = 'cats-detail';

  CatBreeds get catBreeds => Environment.catBreedsList.firstWhere(
    (cat) => cat.name == id,
    orElse: () => CatBreeds(name: 'Unknown', urlImage: ''),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catBreeds.name)),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              catBreeds.urlImage ?? Environment.noImageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  'assets/images/cat.svg',
                  width: 160,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Breed Name: ${catBreeds.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Breed Name: ${catBreeds.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Image.network(
                    catBreeds.urlImage ?? Environment.noImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                        'assets/images/cat.svg',
                        width: 160,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
