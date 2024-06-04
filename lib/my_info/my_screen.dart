import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kuslide/my_info/content_button.dart';
import 'package:kuslide/detail_my_screen/my_writing.dart';
import 'package:kuslide/my_info/logout.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("KuSlide"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.07),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_rounded,
                        size: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "내 정보",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.border_color_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        const ContentButton(
                          //content_button.dart에 상세정보 있음
                          contentIcon: Icons.edit_document,
                          content: "내가 쓴 글 보기",
                          contentSize: 27,
                          detailWidget: MyPageDataWidget(),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        const ContentButton(
                          contentIcon: Icons.logout_outlined,
                          content: "로그아웃",
                          contentSize: 30,
                          detailWidget: LogoutScreen(),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        const ContentButton(
                          contentIcon: Icons.delete_forever_rounded,
                          content: "회원탈퇴",
                          contentSize: 30,
                          detailWidget: MyPageDataWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
