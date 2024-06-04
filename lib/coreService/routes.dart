import 'package:flutter/material.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2_advanced_registration_screen.dart';
import 'package:kuslide/Page/3_main_Page/3_main_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/AdvancedRegistrationPage': (context) =>
      const AdvancedRegistrationPage(), // 회원가입 페이지
  '/MainScreenPage': (context) => const MainScreenPage(), // 메인화면 페이지
};
