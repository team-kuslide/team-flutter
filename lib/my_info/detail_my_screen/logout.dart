// import 'package:flutter/material.dart';
// import 'package:kuslide/Page/1_basic_signup_page/1_basic_singup_screen.dart'; // 실제 로그인 페이지 경로로 변경
// import 'package:kuslide/my_info/session_service.dart';

// class LogoutScreen extends StatelessWidget {
//   const LogoutScreen({super.key});

//   Future<void> _logout(BuildContext context) async {
//     await SessionService.logout();

//     // 로그인 페이지로 이동
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const BasicSingupPage(),
//       ),
//       (Route<dynamic> route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           _logout(context);
//         },
//         child: const Text('Logout'),
//       ),
//     );
//   }
// }
