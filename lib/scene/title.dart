// --------------------------------------------
// Title画面
// --------------------------------------------
import 'package:flutter/material.dart';
import './scene_manager.dart';

class TitleScene extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("Title")),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Start'),
          onPressed: ()
          {
            showTestDIalog(context);
            // Navigator.of(context).pushNamed(KEY_HOME);
          },
        ),
      ),
    );
  }
}
