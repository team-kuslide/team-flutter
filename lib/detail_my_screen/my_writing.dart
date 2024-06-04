import 'dart:math';
import 'package:flutter/material.dart';

class MyWriting extends StatefulWidget {
  const MyWriting({super.key});

  @override
  State<MyWriting> createState() => _MyWritingState();
}

class _MyWritingState extends State<MyWriting> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemSize = screenWidth * 0.31;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("내가 쓴 글"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75, // 이 비율을 통해 각 항목의 높이를 조절합니다.
        ),
        itemCount: 30,
        itemBuilder: (context, index) => SizedBox(
          width: itemSize,
          child: Column(
            children: [
              SizedBox(
                width: itemSize,
                height: itemSize,
                child: Stack(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/150', // 이미지 가져오기
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      right: 6,
                      top: -5,
                      child: DropdownButton<String>(
                        icon: const Icon(
                          size: 30,
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                        items: <String>['삭제', '하트'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Do something with the selected option
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: itemSize,
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(5),
                child: const Text(
                  '얼마나짧은글이써지는지확인중', //작성한 글 가져오기
                  style: TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
