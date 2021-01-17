// --------------------------------------------
// シーン遷移管理
// --------------------------------------------
import 'package:flutter/cupertino.dart';
import 'title.dart';
import 'home.dart';

final String key_title = "title";
final String key_home = "home";

// 開始ルート取得
String getInitialRoute()
{
  return key_title;
}

// シーン遷移MAP取得
Map<String, Widget Function(BuildContext)> getRoutes()
{
  var map = {
    key_title: (context) => TitleScene(),
    key_home: (context) => HomeScene(),
  };
  return map;
}

// デバッグ用：タイトル文言取得
String getDbgTitle(String title)
{
  return "[jewel] " + title;
}