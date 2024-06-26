import 'package:dio/dio.dart';
import 'package:kuslide/my_info/api_model.dart';

Future<List<MyPageResponse>?> fetchMyPageData() async {
  Dio dio = Dio();

  String session = "";
  // 헤더에 세션 정보 추가
  dio.options.headers["Cookie"] = "SESSION=$session";
  try {
    const url = 'httage'; // 실제 URL로 변경
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print("성공");
      print(response.data);

      List<MyPageResponse> myInstances = (response.data as List)
          .map((json) => MyPageResponse.fromJson(json))
          .toList();

      return myInstances;
    } else {
      print("Failed with status code: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    if (e is DioError) {
      print('DioError: ${e.response?.statusCode}');
    } else {
      print('Unknown error: $e');
    }
    return null;
  }
}
