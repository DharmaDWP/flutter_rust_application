import 'package:InOut/injection.dart';
import 'package:InOut/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  print("Injecting...");
  await setup();
  print("Inject complete!");

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MainApp(
    token: prefs.getString("token"),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.token,
  });

  final token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SplashScreen(
          token: token,
        ),
      ),
    );
  }
}
