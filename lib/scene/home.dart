// --------------------------------------------
// Home画面
// --------------------------------------------
import 'package:flutter/material.dart';
import './scene_manager.dart';

class HomeScene extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("Home")),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Back'),
          onPressed: () 
          {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
