import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: const SizedBox(
          width: 150,
          height: 150,
          child: CircularProgressIndicator(
            value: null,
            strokeWidth: 10,
            semanticsLabel: 'Circular progress indicator',
          ),
        ),
      ),
    );
  }
}
