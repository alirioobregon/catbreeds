import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test_pragma/domain/entities/cat_breeds.dart';
import 'package:technical_test_pragma/presentation/providers/cats_repository_provider.dart';

final catBreedsNotifier =
    AsyncNotifierProvider<CatBreedsController, List<CatBreeds>>(
      CatBreedsController.new,
    );

class CatBreedsController extends AsyncNotifier<List<CatBreeds>> {
  @override
  Future<List<CatBreeds>> build() async {
    final repo = ref.read(catRepositoryProvider);
    return repo.getListCats();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(catRepositoryProvider);
      return repo.getListCats();
    });
  }
}
