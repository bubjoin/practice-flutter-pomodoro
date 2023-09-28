import 'package:flutter/material.dart';
import 'displays/home_display.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.lightGreen,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.amberAccent,
            ),
          ),
          cardColor: Colors.white),
      home: const HomeDisplay(),
    );
  }
}
