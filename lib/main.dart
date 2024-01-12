import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const App());

  Future.delayed(const Duration(seconds: 5), () {
    FlutterNativeSplash.remove();
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
