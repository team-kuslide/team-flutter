import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool isMale = false;
  bool isFemale = false;
  bool isNonSpecific = false;
  String? selectedDepartment;
  String? selectedFaculty;
  final Map<String, List<String>> facultiesAndDepartments = {
    '과학기술대학': ['컴퓨터공학과', '바이오메디컬공학과', '메카트로닉스공학과','녹색기술융합학과', '에너지신소재공학과'],
    '디자인대학': ['산업디자인학과', '실내디자인학과', '패션디자인학과', '조형예술학과','미디어콘텐츠학과', '시각영상디자인학과'],
    '인문사회융합대학' : ['경영학과', '경제통상학과','경찰학과', '소방방재융합학과', '문헌정보학과', '유아교육과', '사회복지학과','신문방송학과', '동화한국어문화학과', '영어문화학과'],
    '의료생명대학' : ['간호학과', '바이오의약학과', '생명공학과', '식품영양학과', '뷰티화장품학과', '스포츠건강학과', '골프산업학과'],
    '의과대학' : ['의학과']
  };

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: genderOption('남자', isMale, (bool? value) {
                if (value != null) {
                  setState(() {
                    isMale = value;
                    isFemale = !value;
                    isNonSpecific = !value;
                  });
                }
              }),
            ),
            Expanded(
              child: genderOption('여자', isFemale, (bool? value) {
                if (value != null) {
                  setState(() {
                    isFemale = value;
                    isMale = !value;
                    isNonSpecific = !value;
                  });
                }
              }),
            ),
            Expanded(
              child: genderOption('무관', isNonSpecific, (bool? value) {
                if (value != null) {
                  setState(() {
                    isNonSpecific = value;
                    isMale = !value;
                    isFemale = !value;
                  });
                }
              }),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        DropdownButtonFormField<String>(
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
            contentPadding: const EdgeInsets.only(left: 15),
          ),
          hint: Text('학부'),
          value: selectedFaculty,
          items: facultiesAndDepartments.keys.map((String faculty) {
            return DropdownMenuItem(
              value: faculty,
              child: Text(faculty),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedFaculty = newValue;
              selectedDepartment = null; // 학부를 변경하면 학과 선택을 초기화
            });
          },
        ),
        SizedBox(height: screenHeight * 0.01),
        if (selectedFaculty != null)
          DropdownButtonFormField<String>(
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
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            hint: Text('학과'),
            value: selectedDepartment,
            items: facultiesAndDepartments[selectedFaculty]!
                .map((String department) {
              return DropdownMenuItem(
                value: department,
                child: Text(department),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedDepartment = newValue;
              });
            },
          ),
      ],
    );
  }

  Widget genderOption(String title, bool value, void Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}
