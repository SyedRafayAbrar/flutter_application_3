import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelTextValue;
  final Key? key; // Key parameter should be of type Key

  const PrimaryTextField({required this.labelTextValue, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: TextFormField(
        validator: (String? value) {
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
        decoration: InputDecoration(
          semanticCounterText: "-",
          labelText: labelTextValue,
          hintText: "Email Address/UserName",
          border: const UnderlineInputBorder(),
        ),
        style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
      ),
    );
  }
}

