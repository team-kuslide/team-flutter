import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2.1_textFormField.dart/1_email.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2.1_textFormField.dart/2_verificationCode.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2.1_textFormField.dart/3_password.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2.1_textFormField.dart/4_personalInfo.dart';
import 'package:kuslide/Page/2_advanced_registration_page/2.1_textFormField.dart/5_csbm.dart';

class AdvancedRegistrationPage extends StatefulWidget {
  const AdvancedRegistrationPage({super.key});

  @override
  State<AdvancedRegistrationPage> createState() =>
      _AdvancedRegistrationPageState();
}

class _AdvancedRegistrationPageState extends State<AdvancedRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // 반응형 미디어 쿼리 입니다. (세로)
    final screenWidth =
        MediaQuery.of(context).size.width; // 반응형 미디어 쿼리 입니다. (가로)

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 6,
            left: 3,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.back,
                size: 32,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  const InputEmail(),
                  SizedBox(height: screenHeight * 0.01),
                  const InputVerificationCode(),
                  SizedBox(height: screenHeight * 0.01),
                  const InputPassword(),
                  SizedBox(height: screenHeight * 0.01),
                  const PersonalInfo(),
                  CSMBS(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
