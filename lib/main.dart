import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
  
  try {
    await initFirebase();
  } catch (e) {
    print("Firebase init failed: $e");
  }

  runApp(const MyApp());
}

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fajr Al Sham',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: const Scaffold(
        body: Center(
          child: Text('فجر الشام'),
        ),
      ),
    );
  }
}
