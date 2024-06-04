// import 'package:dio/dio.dart';

// Future<bool> submitForm(String joinemail, String joinpassword) async {
//   Dio dio = Dio();
//   dio.options.headers['Content-Type'] = 'application/json';
//   Map<String, String> data = {
//     'username': joinemail,
//     'password': joinpassword,
//     'platform': 'FLUTTER'
//   };

//   // Send POST request
//   try {
//     const url = 'ha.com/accoun/logi';
//     Response response = await dio.post(url, data: data);
//     if (response.statusCode == 200) {
//       print("성공");
//       return true;
//     } else {
//       print(response.statusCode);
//       return false;
//     }
//   } catch (e) {
//     if (e is DioError) {
//       print('DioError왜 뜨는데 진짜: ${e.response?.data}');
//     } else {
//       print('Unknown error: $e');
//     }
//     return false;
//   }
// }
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
    const url =
        'hgin';

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
    print(response);
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
    } else {
      print('Unknown error: $e');
    }
    return false;
  }
}
