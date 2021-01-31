// --------------------------------------------
// ログイン画面
// --------------------------------------------
import 'package:flutter/material.dart';
import 'scene_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScene extends StatelessWidget {
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("ログイン画面")),
      ),
      body: Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  controller: emailInputController,
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  controller: passwordInputController,
                  decoration: new InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      try {
                        // メールアドレス・パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signInWithEmailAndPassword(
                          email: emailInputController.text,
                          password: passwordInputController.text,
                        );
                        // ホーム画面へ遷移
                        await Navigator.of(context).pushNamed(KEY_HOME);
                      } catch (e) {
                        // 失敗した場合
                        print("ログインに失敗しました：${e.message}");
                      }
                    },
                  ),
                ),
                new Center(
                  child: FlatButton(
                    child: Text('新規登録'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(KEY_SIGNUP);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
