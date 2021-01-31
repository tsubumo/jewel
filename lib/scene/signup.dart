// --------------------------------------------
// 新規登録画面
// --------------------------------------------
import 'package:flutter/material.dart';
import 'scene_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScene extends StatelessWidget {
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("新規登録画面")),
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
                    child: const Text('SignUp'),
                    onPressed: () async {
                      try {
                        // メールアドレス・パスワードでユーザー登録
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.createUserWithEmailAndPassword(
                          email: emailInputController.text,
                          password: passwordInputController.text,
                        );
                        // ホーム画面へ遷移
                        await Navigator.of(context).pushNamed(KEY_HOME);
                      } catch (e) {
                        // 失敗した場合
                        print("登録に失敗しました：${e.message}");
                      }
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
