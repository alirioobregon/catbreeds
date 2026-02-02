import 'package:flutter/material.dart';
import 'package:technical_test_pragma/config/constants/environment.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splash-screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Icon(Icons.abc_outlined),
            Text(Environment.apiKey),
          ],
        ),
      ),
    );
  }
}
