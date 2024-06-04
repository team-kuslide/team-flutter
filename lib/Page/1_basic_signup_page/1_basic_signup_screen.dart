import 'package:flutter/material.dart';
import 'package:kuslide/Page/1_basic_signup_page/1.1_input_email.dart';
import 'package:kuslide/Page/1_basic_signup_page/1.2_input_password.dart';
import 'package:kuslide/Page/1_basic_signup_page/1.3_findPassword_join.dart';
import 'package:kuslide/coreService/login_dio.dart';

class BasicSingupPage extends StatefulWidget {
  const BasicSingupPage({super.key});

  @override
  State<BasicSingupPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BasicSingupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  Future<bool> loginRequest(String email, String password) async {
    bool result = await submitForm(email, password);
    return result; // 여기에서 결과를 반환
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.2),
                SizedBox(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.7,
                  child: Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Text('로고 이미지를 넣으시면 됩니다!'),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                StudentEmailCheck(controller: _emailController),
                StudentPasswordCheck(controller: _passwordController),
                const FindPassWordJoinmembership(),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    loginRequest(email, password);
                  },
                  child: const Text('Submit'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 25),
                    const Text(
                      '회원가입 없이',
                      style: TextStyle(
                        color: Color(0xff6c6c6c),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/MainScreen');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff757575),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  '메인화면 둘러보기',
                                  style: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}