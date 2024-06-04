import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({super.key});

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  bool _isEmailStateIcon = false;
  bool _isfirst = true; // @ 처음 입력 확인
  bool _isEmailValid = true; // 이메일 확인

  // Email validation (add your own logic here)
  bool isValidEmail(String email) {
    return email.contains('@') && email.endsWith('@kku.ac.kr');
  }

  // Automatic email completion
  void isVaildEmail(String email) {
    int domainIndex = email.indexOf("@kku.ac.kr");
    if (email.contains('@') && _isfirst && !email.endsWith("kku.ac.kr")) {
      String newEmail = "${email}kku.ac.kr";
      _isfirst = false;
      if (_emailController.text != newEmail) {
        _emailController.text = newEmail;
        _emailController.selection = TextSelection.fromPosition(
          TextPosition(offset: newEmail.length),
        );
      }
    } else if (!email.contains('@') || email.isEmpty) {
      _isfirst = true;
    } else if (domainIndex != -1) {
      String adjustedEmail =
          email.substring(0, domainIndex + "@kku.ac.kr".length);
      _emailController.text = adjustedEmail;
      _emailController.selection = TextSelection.fromPosition(
        TextPosition(offset: adjustedEmail.length),
      );
    }
  }

  // Send email verification code
  Future<void> sendEmailToDio(String email) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 20);
    Map<String, String> data = {
      'mail': email,
      'platform': 'FLUTTER'
    };
    const url = 'ht/il';
    try {
      print("Sending email to: $email");
      Response response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        print("Email sent successfully");
        setState(() {
          _isEmailStateIcon = true; // Show check icon
        });
      } else {
        print("Failed with status code: ${response.statusCode}");
        setState(() {
          _isEmailValid = false; // Update border color for error
        });
      }
    } on DioError catch (e) {
      print("DioError: ${e.message}");
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          print("Connection timeout: ${e.message}");
          break;
        case DioErrorType.sendTimeout:
          print("Send timeout: ${e.message}");
          break;
        case DioErrorType.receiveTimeout:
          print("Receive timeout: ${e.message}");
          break;
        case DioErrorType.badResponse:
          print("Server responded with an error: ${e.response?.statusCode}");
          break;
        case DioErrorType.cancel:
          print("Request cancelled: ${e.message}");
          break;
        case DioErrorType.unknown:
          print("Network error or server error: ${e.message}");
          break;
        default:
          print("Unknown DioError: ${e.message}");
      }
      setState(() {
        _isEmailValid = false; // Update border color for error
      });
    } catch (e) {
      print("Unknown error: $e");
      setState(() {
        _isEmailValid = false; // Update border color for error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            focusNode: _emailFocusNode,
            controller: _emailController,
            enabled: !_isEmailStateIcon,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isEmailValid
                      ? const Color(0xffc1c1c1)
                      : const Color(0xfff64f4f),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff6fbf8a),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isEmailValid
                      ? const Color(0xff6fbf8a)
                      : const Color(0xfff64f4f),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: '학교 이메일 입력',
              hintStyle: const TextStyle(
                  color: Color(0xffc1c1c1),
                  fontFamily: 'Pretendard',
                  fontSize: 13),
              suffixIcon: Stack(
                children: [
                  Visibility(
                    child: Container(
                      child: !_isEmailStateIcon
                          ? IconButton(
                              icon: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey)),
                                        ),
                                        child: const Text(
                                          '인증번호 전송',
                                          style: TextStyle(
                                            color: Color(0xff757575),
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                sendEmailToDio(_emailController.text);
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, bottom: 13, left: 7),
                              child: SizedBox(
                                  height: 24,
                                  child: Image.asset(
                                      'assets/images/checkIcon.png')),
                            ),
                    ),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
