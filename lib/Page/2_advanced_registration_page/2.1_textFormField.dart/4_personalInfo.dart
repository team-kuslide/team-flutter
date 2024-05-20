import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
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
            hintText: '닉네임',
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
            hintText: '성별',
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
            hintText: '학과',
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
