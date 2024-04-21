import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  RangeSelectorForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextformField(
              labelText: 'Minimum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().min = value,
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextformField(
              labelText: 'Maximum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            )
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextformField extends StatelessWidget {
  RangeSelectorTextformField(
      {super.key, required this.labelText, required this.intValueSetter});

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(labelText),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        }
        return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
