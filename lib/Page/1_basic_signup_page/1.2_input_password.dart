import 'package:flutter/material.dart';

class StudentPasswordCheck extends StatefulWidget {
  final TextEditingController controller;

  const StudentPasswordCheck({super.key, required this.controller});

  @override
  State<StudentPasswordCheck> createState() => _StudentPasswordCheckState();
}

class _StudentPasswordCheckState extends State<StudentPasswordCheck> {
  // final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            focusNode: _passwordFocusNode,
            controller: /*_passwordController*/ widget.controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffc1c1c1),
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
                borderSide: const BorderSide(
                  color: Color(0xff6fbf8a),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: '비밀번호 입력',
              hintStyle: const TextStyle(
                  color: Color(0xffc1c1c1),
                  fontFamily: 'Pretendard',
                  fontSize: 13),
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}