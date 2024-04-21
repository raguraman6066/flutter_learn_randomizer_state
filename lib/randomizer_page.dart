// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final randomGenerator = Random();
  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          generatedNumber.value?.toString() ?? 'Generate a number',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
        child: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
