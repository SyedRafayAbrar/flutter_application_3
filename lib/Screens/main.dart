import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/app_theme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/Screens/complaints.dart';
import 'package:flutter_application_3/Screens/home.dart';
import 'package:flutter_application_3/Screens/my_appartments.dart';
import 'package:flutter_application_3/Screens/signUpScreens/appartment_info_screen.dart';
import 'package:flutter_application_3/Screens/signUpScreens/invitation_screen.dart';
import 'package:flutter_application_3/Screens/signUpScreens/select_residential_Status.dart';
import 'package:flutter_application_3/Screens/sign_up.dart';
import 'package:flutter_application_3/Screens/item_detail.dart';
import 'package:flutter_application_3/Screens/customer_dashboard.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
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
          case 'InvitationScreen':
            return MaterialPageRoute(builder: (context) => InvitationScreen());
          case 'selectResidentialScreen':
            return MaterialPageRoute(builder: (context) => SelectResidentialScreen());
          case 'appartmentInfoScreen':
            return MaterialPageRoute(builder: (context) => AppartmentInfoScreen());
          case 'myAppartments':
            return MaterialPageRoute(builder: (context) => MyAppartments());  
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
    String apiToken = await secureStorateShared
        .readSecureData(KeyChainAccessConstants.apiToken) as String;
    return (apiToken != '') ? CustomerDashboardScreen() : LoginScreen();
  }

  void onButtonPressed() {
    print("Button Pressed");
  }
}
