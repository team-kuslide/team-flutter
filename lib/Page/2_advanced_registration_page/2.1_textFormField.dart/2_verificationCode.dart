import 'package:flutter/material.dart';

class InputVerificationCode extends StatefulWidget {
  const InputVerificationCode({super.key});

  @override
  State<InputVerificationCode> createState() =>
      _InputInputVerificationCodeState();
}

class _InputInputVerificationCodeState extends State<InputVerificationCode> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        hintText: '인증번호',
        hintStyle: const TextStyle(
            color: Color(0xffc1c1c1), fontFamily: 'Pretendard', fontSize: 13),
        contentPadding: const EdgeInsets.only(left: 15),
      ),
      onChanged: (value) {},
    );
  }
}
