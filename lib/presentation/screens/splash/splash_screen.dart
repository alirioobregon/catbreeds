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
            Expanded(
              child: catBreedsAsync.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final i = data[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          i.urlImage.toString(),
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(i.name),
                      subtitle: Text(i.urlImage ?? ''),
                    );
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
