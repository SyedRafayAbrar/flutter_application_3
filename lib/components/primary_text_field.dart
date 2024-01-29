import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelTextValue;
  final String hintTextValue;
  final Key? key; // Key parameter should be of type Key
  final TextEditingController textEditingController;
  int? maxLines = 1;

  PrimaryTextField({required this.labelTextValue, required this.hintTextValue,required this.textEditingController, this.maxLines, this.key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: TextFormField(
        maxLines: maxLines,
        controller: textEditingController,
        validator: (String? value) {
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
        decoration: InputDecoration(
          semanticCounterText: "-",
          labelText: labelTextValue,
          hintText: hintTextValue,
          labelStyle: const TextStyle(fontFamily: 'OutFit'),
          border: const UnderlineInputBorder(),
        ),
        style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontFamily: 'OutFit'),
      ),
    );
  }
}

