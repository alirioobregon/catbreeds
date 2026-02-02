import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';
import 'package:technical_test_pragma/presentation/providers/cats_providers.dart';

class SplashScreen extends ConsumerWidget {
  static const name = 'splash-screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catBreedsAsync = ref.watch(catBreedsNotifier);
    // catBreedsAsync.

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Icon(Icons.abc_outlined),
            Text(Environment.apiKey),
            catBreedsAsync.when(
              data: (data) => Text('$data'),
              error: (e, st) => Text('$e'),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
