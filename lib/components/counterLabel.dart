import 'package:flutter/material.dart';
import '/Screens/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterLabel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterProvider);
    return Theme(
        data: ThemeData(
            textTheme: TextTheme(displayMedium: TextStyle(fontSize: 20))),
        child: Center(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.justify,
              )),
        ));
  }
}
