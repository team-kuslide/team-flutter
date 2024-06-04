import 'package:flutter/material.dart';

class CSMBS extends StatefulWidget {
  const CSMBS({Key? key}) : super(key: key);

  @override
  State<CSMBS> createState() => _CustomShowModalBottomSheetState();
}

class _CustomShowModalBottomSheetState extends State<CSMBS> {
  bool allAgreed = false;
  bool serviceAgreed = false;
  bool privacyAgreed = false;
  bool marketingAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Checkbox(
              value: allAgreed,
              onChanged: (bool? value) {
                setState(() {
                  allAgreed = value ?? false;
                  serviceAgreed = allAgreed;
                  privacyAgreed = allAgreed;
                  marketingAgreed = allAgreed;
                });
              },
            ),
            const Text('전체 동의하기', style: TextStyle(fontSize: 16)),
          ],
        ),
        buildAgreementRow('서비스 이용약관 동의 (필수)', serviceAgreed, () {
          setState(() {
            serviceAgreed = !serviceAgreed;
          });
        }),
        buildAgreementRow('개인정보 취급방침 동의 (필수)', privacyAgreed, () {
          setState(() {
            privacyAgreed = !privacyAgreed;
          });
        }),
        buildAgreementRow('마케팅 정보 수신 동의 (선택)', marketingAgreed, () {
          setState(() {
            marketingAgreed = !marketingAgreed;
          });
        }),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {
                  if (serviceAgreed && privacyAgreed) {}
                },
                child: const Text('시작하기',
                    style: TextStyle(fontSize: 22, color: Colors.white))),
          ),
        ),
      ],
    );
  }

  Widget buildAgreementRow(String text, bool agreed, VoidCallback onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          Checkbox(
            value: agreed,
            onChanged: (bool? value) {
              onChanged();
            },
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
          ),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text('보기 >',
                style: TextStyle(color: Colors.grey, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
