import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../home_dashboard/home_dashboard_widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  static String routeName = 'Register';
  static String routePath = '/register';

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // حفظ الجلسة محلياً
  Future<void> _saveSession(String localId, String idToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('localId', localId);
    await prefs.setString('idToken', idToken);
  }

  // دالة حفظ البيانات الشخصية في قاعدة البيانات
  Future<void> _saveUserProfile(String localId, String idToken) async {
    final url = Uri.parse('https://fajr-alsham-default-rtdb.firebaseio.com/users/$localId.json?auth=$idToken');

    try {
      await http.put(
        url,
        body: jsonEncode({
          'firstName': _firstNameController.text.trim(),
          'fatherName': _fatherNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'email': _emailController.text.trim(),
        }),
      );
    } catch (e) {
      print('خطأ في حفظ البيانات الشخصية: $e');
    }
  }

  // دالة إنشاء الحساب مع التحقق من ملء الحقول
  Future<void> _registerUser() async {
    // 1. التحقق من أن الحقول غير فارغة
    if (_firstNameController.text.trim().isEmpty ||
        _fatherNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء تعبئة جميع الحقول الشخصية وباقي البيانات'), backgroundColor: Colors.red),
      );
      return;
    }

    const String apiKey = 'AIzaSyCkNo6ySEgBWk1c1iet9LQN4KcDVy9wBOI';
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey');

    setState(() => _isLoading = true);
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        String idToken = responseData['idToken'];
        String localId = responseData['localId'];

        // حفظ البيانات وحفظ الجلسة محلياً
        await _saveUserProfile(localId, idToken);
        await _saveSession(localId, idToken);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء الحساب بنجاح وتسجيل الدخول!'),
              backgroundColor: Colors.green,
            ),
          );
          
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeDashboardWidget()),
            (route) => false,
          );
        }
      } else {
        String errorMessage = responseData['error']['message'] ?? 'حدث خطأ في إنشاء الحساب';
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطأ: $errorMessage'), backgroundColor: Colors.red),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل الاتصال بالخادم: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        elevation: 0,
        centerTitle: true,
        title: const Text('إنشاء حساب جديد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('انضم إلى فجر الشام للاستثمار', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              const SizedBox(height: 6),
              const Text('أدخل بياناتك الشخصية الأساسية لإنشاء محفظتك', style: TextStyle(fontSize: 13, color: Color(0xFF64748B))),
              const SizedBox(height: 24),

              // الاسم الأول
              const Text('الاسم الأول *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(icon: Icon(Icons.person_outline, color: Color(0xFF94A3B8)), hintText: 'مثال: طارق', border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 16),

              // اسم الأب
              const Text('اسم الأب *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: TextField(
                  controller: _fatherNameController,
                  decoration: const InputDecoration(icon: Icon(Icons.person_outline, color: Color(0xFF94A3B8)), hintText: 'مثال: جميل', border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 16),

              // النسبة
              const Text('النسبة (العائلة) *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(icon: Icon(Icons.badge_outlined, color: Color(0xFF94A3B8)), hintText: 'مثال: الشعار', border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 16),

              // البريد الإلكتروني
              const Text('البريد الإلكتروني *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(icon: Icon(Icons.email_outlined, color: Color(0xFF94A3B8)), hintText: 'name@example.com', border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 16),

              // كلمة المرور
              const Text('كلمة المرور *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(icon: Icon(Icons.lock_outline, color: Color(0xFF94A3B8)), hintText: '••••••••', border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F766E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('إنشاء الحساب الان', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
