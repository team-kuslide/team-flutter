import 'package:flutter/material.dart';

class StudentEmailCheck extends StatefulWidget {
  final TextEditingController controller;

  const StudentEmailCheck({super.key, required this.controller});

  @override
  State<StudentEmailCheck> createState() => _StudentEmailCheckState();
}

class _StudentEmailCheckState extends State<StudentEmailCheck> {
  // final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final bool _isEmailStateIcon = false;
  bool _isfirst = true; // @ 처음 입력 확인
  final bool _isEmailValid = true; // 이메일 확인

  // 이메일 자동 완성
  void isVaildEmail(String email) {
    int domainIndex = email.indexOf("@kku.ac.kr");
    if (email.contains('@') && _isfirst && !email.endsWith("kku.ac.kr")) {
      String newEmail = "${email}kku.ac.kr";
      _isfirst = false;
      if (/*_emailController*/ widget.controller.text != newEmail) {
        widget.controller.text = newEmail;
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: newEmail.length),
        );
      }
    } else if (!email.contains('@') || email.isEmpty) {
      _isfirst = true;
    } else if (domainIndex != -1) {
      String adjustedEmail =
          email.substring(0, domainIndex + "@kku.ac.kr".length);
      widget.controller.text = adjustedEmail;
      widget.controller.selection = TextSelection.fromPosition(
        TextPosition(offset: adjustedEmail.length),
      );
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
            controller: widget.controller,
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
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            onChanged: (value) {
              isVaildEmail(value);
            },
          ),
        ),
        const SizedBox(height: 5),
        !_isEmailValid
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '*  학교 이메일을 입력해주세요.',
                    style: TextStyle(
                      color: Color(0xffff3636),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
