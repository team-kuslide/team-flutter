import 'package:flutter/material.dart';
import 'package:kuslide/my_info/api_model.dart';
import 'package:kuslide/my_info/detail_my_screen/my_api_service.dart';

class MyPageDataWidget extends StatefulWidget {
  const MyPageDataWidget({super.key});

  @override
  State<MyPageDataWidget> createState() => _MyPageDataWidgetState();
}

class _MyPageDataWidgetState extends State<MyPageDataWidget> {
  late Future<List<MyPageResponse>?> futureMyPageData;
  late String userId; // 유저아이디 받아오기

  @override
  void initState() {
    super.initState();
    futureMyPageData = fetchMyPageData(); //my_api_service.dart에서 데이터 받아오기
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemSize = screenWidth * 0.31;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("내가 쓴 글"),
      ),
      body: FutureBuilder<List<MyPageResponse>?>(
        future: futureMyPageData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('내가 작성한 글이 없습니다.'),
            );
          } else {
            List<MyPageResponse> myPageData = snapshot.data!;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
              itemCount: myPageData.length,
              itemBuilder: (context, index) {
                MyPageResponse item = myPageData[index];
                return SizedBox(
                  width: itemSize,
                  child: Column(
                    children: [
                      SizedBox(
                        width: itemSize,
                        height: itemSize,
                        child: Stack(
                          children: [
                            Image.network(
                              item.image, // API에서 가져온 이미지
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
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
                                items: <String>['삭제', '하트 ${item.heart}']
                                    .map((String value) {
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
                        child: Text(
                          item.content, // API에서 가져온 작성한 글
                          style: const TextStyle(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
