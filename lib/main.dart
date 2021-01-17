// --------------------------------------------
// jewel メイン
// --------------------------------------------
import 'package:flutter/material.dart';
import './scene/scene_manager.dart';

// エントリーポイント
void main() 
{
  runApp(Main());
}

class Main extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'jewel',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: getInitialRoute(),
      routes: getRoutes(),
      );
  }
}
