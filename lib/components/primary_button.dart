import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerWidget {
  final String title;
  final VoidCallback onPressed;

  PrimaryButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: (onPressed),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
// onPressed: (() => (ref.read(counterProvider.notifier).increament())),