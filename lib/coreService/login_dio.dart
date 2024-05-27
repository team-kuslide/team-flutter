import 'package:dio/dio.dart';

Future<bool> submitForm(String joinemail, String joinpassword) async {
  Dio dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  Map<String, String> data = {
    'username': joinemail,
    'password': joinpassword,
    'platform': 'FLUTTER'
  };

  // Send POST request
  try {
    const url = 'ha.com/accoun/logi';
    Response response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      print("성공");
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    if (e is DioError) {
      print('DioError왜 뜨는데 진짜: ${e.response?.data}');
    } else {
      print('Unknown error: $e');
    }
    return false;
  }
}
