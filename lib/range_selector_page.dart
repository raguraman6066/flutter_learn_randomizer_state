import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //need hook-mutable
    final min = useState<int>(0);
    final max = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (int value) {
          min.value = value;
        },
        maxValueSetter: (int value) {
          max.value = value;
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
                    min: min.value,
                    max: max.value,
                  ),
                ));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
