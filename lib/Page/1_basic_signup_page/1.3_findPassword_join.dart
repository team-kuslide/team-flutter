import 'package:flutter/material.dart';

class FindPassWordJoinmembership extends StatefulWidget {
  const FindPassWordJoinmembership({super.key});

  @override
  State<FindPassWordJoinmembership> createState() =>
      _FindPassWordJoinmembershipState();
}

class _FindPassWordJoinmembershipState
    extends State<FindPassWordJoinmembership> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            '비밀번호 찾기',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        const Text('/'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/AdvancedRegistrationPage');
          },
          child: const Text(
            '회원가입',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
