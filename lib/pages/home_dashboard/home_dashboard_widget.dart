import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'home_dashboard_model.dart';
export 'home_dashboard_model.dart';

class HomeDashboardWidget extends StatefulWidget {
  const HomeDashboardWidget({super.key});

  static String routeName = 'HomeDashboard';
  static String routePath = '/homeDashboard';

  @override
  State<HomeDashboardWidget> createState() => _HomeDashboardWidgetState();
}

class _HomeDashboardWidgetState extends State<HomeDashboardWidget> {
  late HomeDashboardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeDashboardModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green, size: 80),
              SizedBox(height: 16),
              Text(
                'أهلاً بك يا طارق في تطبيق فجر الشام',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                'الصفحة تعمل بشكل نظامي 100%',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
