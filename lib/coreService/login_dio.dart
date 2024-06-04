import 'package:dio/dio.dart';

Future<bool> submitForm(String joinemail, String joinpassword) async {
  Dio dio = Dio();
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  dio.options.validateStatus = (status) {
    return status! < 400;
  };
  Map<String, String> data = {
    'username': joinemail,
    'password': joinpassword,
    'platform': 'FLUTTER'
  };

  try {
    const url = 'htt.comnt/lin';

    Response response = await dio.post(url, data: data);

    // 리다이렉션 처리
    if (response.statusCode == 302) {
      String? redirectUrl = response.headers.value('location');
      if (redirectUrl != null) {
        response = await dio.get(redirectUrl);
      }
    }

    // 쿠키 출력
    // List<String>? cookies = response.headers['set-cookie'];
    // print("Cookies: $cookies");
    print(response.headers);
    if (response.statusCode == 200) {
      print("성공");
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    if (e is DioError) {
      print('DioError: ${e.response?.statusCode}');
      List<String>? cookies = e.response?.headers['set-cookie'];
      print("Cookies in error: $cookies");
      print(e.response?.statusCode);
    } else {
      print('Unknown error: $e');
    }
    return false;
  }
}
