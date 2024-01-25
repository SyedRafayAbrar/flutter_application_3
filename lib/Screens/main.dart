import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/networkHelper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/Screens/complaints.dart';
import 'package:flutter_application_3/Screens/home.dart';
import 'package:flutter_application_3/Screens/signUp.dart';
import 'package:flutter_application_3/Screens/itemDetail.dart';
import 'package:flutter_application_3/Screens/customerDashboard.dart';
import '/Screens/loginScreen.dart';
import '/Screens/forgotPassword.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Helpers/helpers.dart';

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
  final NavigationService navigationService = NavigationService();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          case 'login':
            return MaterialPageRoute(builder: (context) => LoginScreen());  
          case 'forgotPW':
            return MaterialPageRoute(
                builder: (context) => ForgotPasswordScreen());
          case 'signUp':
            return MaterialPageRoute(builder: (context) => SignUpScreen());
          case 'itemDetails':
            return MaterialPageRoute(builder: (context) => ItemDetailsScreen());
          case 'customerDashboard':
            return MaterialPageRoute(
                builder: (context) => CustomerDashboardScreen());
          case 'complaint':
            return MaterialPageRoute(builder: (context) => ComplaintsScreen());
          default:
            return MaterialPageRoute(builder: (context) => LoginScreen());
        }
      },
      home:  FutureBuilder<Widget>(
        future: getRoute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // or some loading indicator
          } else if (snapshot.hasError) {
            return LoginScreen(); // or handle the error case
          } else {
            
            return snapshot.data ?? LoginScreen();  
             // return the determined screen or an empty container
          }
        },
      ),
    );
    // return LoginScreen();
  }

  Future<Widget> getRoute() async {
    String apiToken = await SecureStorage()
        .readSecureData(KeyChainAccessConstants.apiToken) as String;
    return (apiToken != '') ? CustomerDashboardScreen() : LoginScreen();
  }

  void onButtonPressed() {
    print("Button Pressed");
  }
}
