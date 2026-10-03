import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fajr_al_sham/flutter_flow/flutter_flow_theme.dart';
import 'package:fajr_al_sham/pages/auth/login_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // تهيئة Firebase ليعمل التطبيق مع قاعدة البيانات والمصادقة
  await Firebase.initializeApp();
  
  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
      FlutterFlowTheme.saveThemeMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fajr Al Sham',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      home: const LoginWidget(),
    );
  }
}
