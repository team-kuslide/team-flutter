// 로그인 모델
import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  bool _loginStatus = false; // 로그인 확인
  bool _isEmailState = false; // 이메일 성공 여부
  bool _isRetypeEmail = false; // 모달창 이메일 재 입력
  String _isUserEmail = ''; // 유저 이메일

  bool get loginStatus => _loginStatus;
  bool get isEmailState => _isEmailState;
  bool get isRetypeEmail => _isRetypeEmail;
  String get isUserEmail => _isUserEmail;

  void setloginStatus(bool loginStatus) {
    _loginStatus = loginStatus;
    notifyListeners();
  }

  void setEmailStatus(bool emailStatus) {
    _isEmailState = emailStatus;
    notifyListeners();
  }

  void setRetypeEmail(bool reTypeEmail) {
    _isRetypeEmail = reTypeEmail;
    notifyListeners();
  }

  void setUserEmailStatus(String userEmail) {
    _isUserEmail = userEmail;
    notifyListeners();
  }
}
