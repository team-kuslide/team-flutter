import 'package:flutter/material.dart';
import 'package:kuslide/Page/1_basic_signup_page/1_basic_singup_screen.dart';
import 'package:kuslide/coreService/provider.dart';
import 'package:kuslide/coreService/routes.dart';
import 'package:kuslide/my_info/my_api_service.dart';
import 'package:kuslide/my_info/my_screen.dart';
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
        home: const BasicSingupPage());
  }
}
