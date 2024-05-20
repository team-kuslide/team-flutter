import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // 반응형 미디어 쿼리 입니다. (세로)
    return Column(
      children: [
        TextFormField(
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
            hintText: '비밀번호',
            hintStyle: const TextStyle(
                color: Color(0xffc1c1c1),
                fontFamily: 'Pretendard',
                fontSize: 13),
            contentPadding: const EdgeInsets.only(left: 15),
          ),
          onChanged: (value) {},
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
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
            hintText: '비밀번호 확인',
            hintStyle: const TextStyle(
                color: Color(0xffc1c1c1),
                fontFamily: 'Pretendard',
                fontSize: 13),
            contentPadding: const EdgeInsets.only(left: 15),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
