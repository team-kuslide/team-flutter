import 'package:flutter/material.dart';
import 'package:kuslide/Page/1_basic_signup_page/1_basic_singup_screen.dart'; // 실제 로그인 페이지 경로로 변경

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // 로그아웃 처리
          // 예: SharedPreferences를 사용하여 로그인 정보 삭제
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.remove('user_token');

          // 로그인 페이지로 이동
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BasicSingupPage(),
            ),
            (Route<dynamic> route) => false,
          );
        },
        child: const Text('Logout'),
      ),
    );
  }
}
