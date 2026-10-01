import 'package:flutter/material.dart';
import 'package:fajr_al_sham/flutter_flow/flutter_flow_theme.dart';
import 'package:fajr_al_sham/flutter_flow/flutter_flow_util.dart';
// استيراد صفحة الرئيسية الحقيقية (تأكد أن المسار يطابق مكان حفظ الملف لديك)
import 'package:fajr_al_sham/pages/home_dashboard/home_dashboard_widget.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _currentIndex = 0;

  // قائمة الصفحات المعروضة عند الضغط على الأزرار بالسفلي
  final List<Widget> _pages = [
    const HomeDashboardWidget(), // صفحتك الحقيقية الأولى من الفلاتر فلو
    const Center(
      child: Text(
        'صفحة الاستثمار',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ), // صفحة مؤقتة ريثما تنسخ واجهة الاستثمار
    const Center(
      child: Text(
        'صفحة الحساب',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ), // صفحة مؤقتة ريثما تنسخ واجهة الحساب
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // يعرض الصفحة الحالية حسب اختيارك من الشريط
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'الاستثمار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب',
          ),
        ],
      ),
    );
  }
}
