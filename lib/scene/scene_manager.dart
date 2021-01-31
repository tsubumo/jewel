// --------------------------------------------
// シーン遷移管理
// --------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'title.dart';
import 'home.dart';
import 'test_dialog.dart';

const KEY_TITLE = "title";
const KEY_HOME = "home";


// 開始ルート取得
String getInitialRoute()
{
  return KEY_TITLE;
}

// シーン遷移MAP取得
Map<String, Widget Function(BuildContext)> getRoutes()
{
  var map = {
    KEY_TITLE: (context) => TitleScene(),
    KEY_HOME: (context) => HomeScene(),
  };
  return map;
}

// デバッグ用：タイトル文言取得
String getDbgTitle(String title)
{
  return "[jewel] " + title;
}

void showTestDIalog(BuildContext context)
{
  CustomDialog(
    context,
  ).showCustomDialog();
}


// --------------------------------------------
// ダイアログ管理
// --------------------------------------------
class ModalOverlay extends ModalRoute<void> {
 
  // ダイアログ内のWidget
  final Widget contents;
 
  // Androidのバックボタンを有効にするか
  final bool isAndroidBackEnable;
 
  ModalOverlay(this.contents, {this.isAndroidBackEnable = true}) : super();
 
  @override
  Duration get transitionDuration => Duration(milliseconds: 100);
  @override
  bool get opaque => false;
  @override
  bool get barrierDismissible => false;
  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);
  @override
  String get barrierLabel => null;
  @override
  bool get maintainState => true;
 
 
  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }
 
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
 
  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: dialogContent(context),
    );
  }
 
  Widget dialogContent(BuildContext context) {
    return WillPopScope(
      child: this.contents,
      onWillPop: () {
        return Future(() => isAndroidBackEnable);
      },
    ); 
  }
}
