import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  RangeSelectorPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomizerPage(),
                ));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
