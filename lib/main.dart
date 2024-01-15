import 'package:easy_budget/pages/add_expense.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import './config/config.dart' as config;
import 'db/db.dart' as db;

void main() async {
  var databaseConfig = config.config['database'];

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final database = await db.initializeDatabase(
      databaseConfig['name'], databaseConfig['version']);

  runApp(App(database: database));

  Future.delayed(const Duration(seconds: 5), () {
    FlutterNativeSplash.remove();
  });
}

class App extends StatelessWidget {
  final Database database;

  const App({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AddExpense());
  }
}
