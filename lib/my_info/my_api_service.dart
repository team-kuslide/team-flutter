// import 'package:http/http.dart' as http;
// import 'package:kuslide/my_info/api_model.dart';
// import 'dart:convert';

// class MyApiService {
//   static String baseUrl =
//       "http://kuslide-env.eba-w4k3vejk.ap-northeast-2.elasticbeanstalk.com";
//   static String myPage = "account/mypage";

//   Future<void> getUserInfo() async {
//     final url = Uri.parse('$baseUrl/$myPage');
//     final response = await http.get(url, headers: {
//       'SESSION': 'YzYwZWY5N2QtMTA5Mi00NTZhLWEzNDYtNmRiNDg3ZDg0YTRk'
//     });

//     if (response.statusCode == 200) {
//       print(response.body);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:kuslide/my_info/api_model.dart';
import 'dart:convert';

class MyApiService {
  final String baseUrl =
      "http://kuslide-env.eba-w4k3vejk.ap-northeast-2.elasticbeanstalk.com";
  final String myPage = "account/mypage";

  void getUserInfo() async {
    final url = Uri.parse("$baseUrl/$myPage");
    final response = await http.get(url, headers: {
      'SESSION': 'OTc1OWZmMmUtYjAOZSOOODEwLWEyMTQtZjk4MGYOMTRkNzc5',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'PostmanRuntime/7.39.0'
    });

    if (response.statusCode == 200) {
      print(response.body);
      return;
    } else {
      print('Failed to load user info: ${response.statusCode}');
    }
  }
}
