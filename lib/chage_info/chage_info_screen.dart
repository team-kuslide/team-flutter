import 'package:flutter/material.dart';

class ChangeInfo extends StatelessWidget {
  const ChangeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KuSlide"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(height: 30),
          Text("회원정보 수정"),
        ],
      ),
    );
  }
}
