import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/presentation/providers/cats_filtered_providers.dart';
import 'package:technical_test_pragma/presentation/providers/cats_providers.dart';
import 'package:technical_test_pragma/presentation/widgets/text_widgets_custom.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.read(catSearchQueryProvider.notifier).searchQuery;
    final controller = ref.read(catSearchQueryProvider.notifier);
    final catBreedsProvider = ref.watch(catSearchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CatBreeds',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller.textController,
                keyboardType: TextInputType.text,
                onChanged: (value) => controller.setSearchQuery(value),
                decoration: InputDecoration(
                  hintText: 'Buscar raza...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => {
                            controller.textController.clear(),
                            controller.clearSearchQuery(),
                            // FocusScope.of(context).unfocus(),
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: catBreedsProvider.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final i = data[index];
                    return ItemCard(catBreeds: i);
                  },
                ),
                error: (e, st) => Text('$e'),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final CatBreeds catBreeds;

  const ItemCard({super.key, required this.catBreeds});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/details/${catBreeds.name}');
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      catBreeds.name,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Text('Mas...', textAlign: TextAlign.end)),
                ],
              ),
              SizedBox(height: 8),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 180),
                child: Image.network(
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
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TitleSubtitleData(
                      title: 'País: ',
                      subtitle: catBreeds.origin,
                    ),
                  ),
                  Expanded(
                    child: TitleSubtitleData(
                      title: 'Inteligencia: ',
                      subtitle: catBreeds.intelligence.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
