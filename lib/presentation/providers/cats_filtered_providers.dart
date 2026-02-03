import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/presentation/providers/cats_providers.dart';

final catSearchQueryProvider =
    AsyncNotifierProvider<CatSearchQueryController, List<CatBreeds>>(
      CatSearchQueryController.new,
    );

class CatSearchQueryController extends AsyncNotifier<List<CatBreeds>> {
  String _searchQuery = '';
  final TextEditingController textController = TextEditingController();

  void setSearchQuery(String query) {
    _searchQuery = query;
    ref.invalidateSelf();
  }

  String get searchQuery => _searchQuery;

  void clearSearchQuery() {
    _searchQuery = '';
    ref.invalidateSelf();
  }

  @override
  Future<List<CatBreeds>> build() async {
    // final repo = ref.read(catRepositoryProvider);
    final allCats = await ref.watch(catBreedsNotifier.future);

    if (_searchQuery.isEmpty) {
      return allCats;
    } else {
      return allCats
          .where(
            (cat) =>
                cat.name.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }
  }
}
