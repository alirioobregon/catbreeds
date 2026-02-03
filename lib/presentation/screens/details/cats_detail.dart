import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/presentation/widgets/text_widgets_custom.dart';

class CatsDetail extends StatelessWidget {
  final String id;

  const CatsDetail({super.key, required this.id});

  static const name = 'cats-detail';

  CatBreeds get catBreeds => Environment.catBreedsList.firstWhere(
    (cat) => cat.name == id,
    orElse: () => CatBreeds(
      name: 'Unknown',
      urlImage: '',
      id: '',
      origin: '',
      temperament: '',
      energyLevel: 0,
    ),
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
                  width: double.infinity,
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
                    catBreeds.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 16),
                  TitleSubtitleData(
                    title: 'País: ',
                    subtitle: catBreeds.origin,
                  ),
                  SizedBox(height: 8),
                  TitleSubtitleData(
                    title: 'Inteligencia: ',
                    subtitle: catBreeds.intelligence.toString(),
                  ),
                  SizedBox(height: 8),
                  TitleSubtitleData(
                    title: 'Temperamento: ',
                    subtitle: catBreeds.temperament,
                  ),
                  SizedBox(height: 8),
                  TitleSubtitleData(
                    title: 'Nivel de energía: ',
                    subtitle: catBreeds.energyLevel.toString(),
                  ),
                  SizedBox(height: 8),
                  if (catBreeds.lifeSpan != null) ...[
                    TitleSubtitleData(
                      title: 'Esperanza de vida: ',
                      subtitle: catBreeds.lifeSpan!,
                    ),
                    SizedBox(height: 8),
                  ],
                  TitleSubtitleData(
                    title: 'Adaptabilidad: ',
                    subtitle: catBreeds.adaptability.toString(),
                  ),
                  SizedBox(height: 8),
                  if (catBreeds.wikipediaUrl != null) ...[
                    RichText(
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Más información: ',
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          TextSpan(
                            text: catBreeds.wikipediaUrl,
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
