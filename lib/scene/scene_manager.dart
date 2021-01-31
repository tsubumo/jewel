// --------------------------------------------
// シーン遷移管理
// --------------------------------------------
import 'package:flutter/cupertino.dart';
import 'title.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';

final String key_title = "title";
final String key_home = "home";
final String key_login = "login";
final String key_signup = "signup";
// 開始ルート取得
String getInitialRoute() {
  return key_title;
}

// シーン遷移MAP取得
Map<String, Widget Function(BuildContext)> getRoutes() {
  var map = {
    key_title: (context) => TitleScene(),
    key_home: (context) => HomeScene(),
    key_login: (context) => LoginScene(),
    key_signup: (context) => SignupScene(),
  };
  return map;
}

// デバッグ用：タイトル文言取得
String getDbgTitle(String title) {
  return "[jewel] " + title;
}
