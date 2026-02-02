import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/presentation/providers/cats_providers.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catBreedsAsync = ref.watch(catBreedsNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CatBreeds',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: catBreedsAsync.when(
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
    return Card(
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
                  ),
                ),
                Expanded(child: Text(catBreeds.name, textAlign: TextAlign.end)),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 160),
              child: SvgPicture.asset(
                'assets/images/cat.svg',
                fit: BoxFit.contain,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    catBreeds.name,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(child: Text(catBreeds.name, textAlign: TextAlign.end)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
