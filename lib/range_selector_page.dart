import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (int value) {
          _min = value;
        },
        maxValueSetter: (int value) {
          _max = value;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomizerPage(
                    min: _min,
                    max: _max,
                  ),
                ));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
