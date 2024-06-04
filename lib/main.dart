import 'package:flutter/material.dart';
import 'package:kuslide/Page/1_basic_signup_page/1_basic_signup_screen.dart'; // 수정된 경로
import 'package:kuslide/coreService/provider.dart';
import 'package:kuslide/coreService/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      home: const BasicSingupPage(key: Key('signup_page')), // 수정된 클래스 이름
    );
  }
}