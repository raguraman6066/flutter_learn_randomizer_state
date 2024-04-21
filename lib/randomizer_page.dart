// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
            builder: (context, value, child) {
          return Text(
            value.generatedNumber?.toString() ?? 'Generate a number',
            style: Theme.of(context).textTheme.headlineLarge,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
        child: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
