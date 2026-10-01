import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'components/bottom_nav/bottom_nav_widget.dart';
import 'components/bottom_nav/bottom_nav_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();

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
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

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
      home: wrapWithModel(
        model: BottomNavModel(),
        updateCallback: () {},
        child: const BottomNavWidget(),
      ),
    );
  }
}
