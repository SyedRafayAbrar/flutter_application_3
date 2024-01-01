import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/loginScreen.dart';
import 'components/counterLabel.dart';
import 'components/primaryButton.dart';
import 'components/primaryTextField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increament() => state++;
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

void main() => runApp(ProviderScope(child: MainApp()));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
    }

        // Column(
        //   children: <Widget>[
        //     Card(
        //       elevation: 5,
        //       clipBehavior: Clip.antiAlias,
        //       margin: const EdgeInsets.all(0),
        //       child: Container(
        //         padding: const EdgeInsets.all(15),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     width: 100,
        //                     height: 50,
        //                     color: Colors.red,
        //                   ),
        //                   Container(
        //                     height: 50,
        //                     width: 100,
        //                     color: Colors.black,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Container(
        //           margin: const EdgeInsets.all(5),
        //           width: double.infinity,
        //           child: ElevatedButton(
        //             onPressed: () {},
        //             child: const Text(
        //                 'Bottom Button '), // trying to move to the bottom
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CounterLabel(),
        //     PrimaryButton(
        //       title: "Add New",
        //       onPressed: () => (onButtonPressed()),
        //     ),
        //     ElevatedButton(
        //         onPressed: null,
        //         child: Text("data"),
        //         style: ButtonStyle(
        //             backgroundColor:
        //                 MaterialStateProperty.all<Color>(Colors.red))),

        //                 FloatingActionButton(onPressed: null)
        //   ],
        // )

  void onButtonPressed() {
    print("Button Pressed");
  }
}
