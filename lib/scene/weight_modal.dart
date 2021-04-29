import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'scene_manager.dart';
 
class WeightDialog
{
  BuildContext context;
  WeightDialog(this.context) : super();
 
  /*
   * 表示
   */
  void showDialog() {
 
    Navigator.push(
      context,
      ModalOverlay(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              testWidget()
            ],
          )
        ),
        isAndroidBackEnable: true,
      ),
    );
  }
 
 Widget testWidget()
 {
   return FutureBuilder<QuerySnapshot>(
     future: FirebaseFirestore.instance
        .collection('t_bird_weight')
        .get(),

     builder: (context, snapshot) {
        if (!snapshot.hasData) 
        {
           return Text('Loading...');
        }

        final List<DocumentSnapshot> documents = snapshot.data.docs;
        return Text(documents[0].data()['weight'].toString());
     },
   );
 }
 
  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }
}