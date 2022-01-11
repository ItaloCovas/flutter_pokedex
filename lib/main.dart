import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/introduction_screen.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroductionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
