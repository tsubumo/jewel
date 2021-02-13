// --------------------------------------------
// Home画面
// --------------------------------------------
import 'package:flutter/material.dart';
import 'package:jewel/define/def_image.dart';
import 'package:jewel/scene/scene_manager.dart';

const _BTN_RADIUS = 100.0;


class HomeScene extends StatefulWidget {
  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> 
{
  var _count = 0;

  void onCount()
  {
    setState(() =>
    {
      _count++
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("Home")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              IMG_BUN_SILVER_NORMAL,
              width: 250,
              height: 250,
            ),
            Text("Count: " + _count.toString()),
            _getButton(onCount),
          ],
        ),
      ),
    );
  }
}

Widget _getButton(Function onPressed)
{
  return RaisedButton(
    onPressed: onPressed,
    color: Colors.white70,
    shape: const CircleBorder(
      side: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
    ),
    child: Container(
      width: _BTN_RADIUS,
      height: _BTN_RADIUS,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG_BTN_TEST),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
