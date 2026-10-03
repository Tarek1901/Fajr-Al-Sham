import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// استورد صفحة تسجيل الدخول الخاصة بك هنا، مثلاً:
// import '../login/login_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  // دالة تسجيل الخروج ومسح الجلسة
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // حذف كافة البيانات المخزنة محلياً (localId و idToken)

    if (mounted) {
      // الانتقال لصفحة تسجيل الدخول وإزالة كافة الصفحات السابقة من الذاكرة
      // استبدل LoginWidget() باسم صفحة تسجيل الدخول لديك
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login', // أو استبدلها بـ MaterialPageRoute إذا لم تستخدم المسارات المسمى
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: const Color(0xFF0F766E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ... (باقي محتويات صفحة الملف الشخصي الخاصة بك مثل الاسم والإيميل)
            
            const Spacer(),

            // زر تسجيل الخروج
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'تسجيل الخروج',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
