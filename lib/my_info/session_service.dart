import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionService {
  static final Dio _dio = Dio();
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> logout() async {
    // 저장된 세션 쿠키 가져오기
    final cookie = await _storage.read(key: 'session_cookie');

    if (cookie != null) {
      print(cookie);
      try {
        await _dio.get(
          'http://kuslide-env.eba-w4k3vejk.ap-northeast-2.elasticbeanstalk.com/account/logout', // 실제 로그아웃 엔드포인트로 변경
          options: Options(
            headers: {'Cookie': cookie},
          ),
        );
      } catch (e) {
        print('Logout error: $e');
      } finally {
        // 세션 쿠키 삭제
        await _storage.delete(key: 'session_cookie');
      }
    } else {
      print('cookie가 없나봐...');
    }
  }

  static Future<void> deleteAccount() async {
    // 저장된 세션 쿠키 가져오기
    final cookie = await _storage.read(key: 'session_cookie');

    if (cookie != null) {
      try {
        await _dio.delete(
          'http://your-server-url/delete-account', // 실제 회원탈퇴 엔드포인트로 변경
          options: Options(
            headers: {'Cookie': cookie},
          ),
        );
      } catch (e) {
        print('Delete account error: $e');
      } finally {
        // 세션 쿠키 삭제
        await _storage.delete(key: 'session_cookie');
      }
    }
  }
}
