import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../screen/LoginPage.dart';
import '../screen/mainHome.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return MainHomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  void signOut() {}

  void signInWithGoogle() {}
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final User? user = _auth.currentUser;
final uid = user!.uid;
final GoogleSignIn googleSignIn = new GoogleSignIn();

final DateTime timestamp = DateTime.now();
// final GoogleSignInAccount? gCurrentUser = googleSignIn.currentUser;

final userReference = FirebaseFirestore.instance.collection('users');
// User? currentUser;

signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser =
      await GoogleSignIn(scopes: <String>["email"]).signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // saveUserInfoFirestore();
  DocumentSnapshot documentSnapshot =
      await userReference.doc(googleUser.email).get();

      

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

userstart() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((doc) async {
    print('회원 관리');
    if (!doc.exists) {
      userReference.doc().set({
        'profileName': FirebaseAuth.instance.currentUser!.displayName!,
        'url': FirebaseAuth.instance.currentUser!.photoURL!,
        'email': FirebaseAuth.instance.currentUser!.email,
        'status_message': 'I promise to take the test honestly before GOD.',
        'uid': FirebaseAuth.instance.currentUser!.uid
      }).whenComplete(() {
        print('완료');
      });
    } else {
      print('이미 있는 아이디');
    }
  });
}

Future<void> signOut() async {
  // logOut 기능
  await _auth.signOut();
  print('logOut');
}

contentsFunction(user,category,_photo,contentsController,post) async {  //파이어 베이스 저장 (유저 이름, 사진, 제목, 글 내용 )

 // 스토리지에 먼저 사진 업로드 하는 부분.
  final firebaseStorageRef = FirebaseStorage.instance; 
  List _like = [];
  List _comment = [];
      var doc = FirebaseFirestore.instance.collection('Contents').doc(); 
      doc.set({
        'id': doc.id,
        'datetime' : DateTime.now().toString(),
        'displayName':FirebaseAuth.instance.currentUser!.displayName!,
        'contents' : contentsController.text,
        'imageUrl' : _photo,
        'adress' : post,
        'category' : category,
        '_like' : _like,
        '_comment' : _comment
      }).whenComplete(() => print('데이터 저장 성공'));
    }
    
LikeFunction(like, id, user) async {
  // 좋아요 기능
  List _likes = like;
  _likes.add(user);
  var doc = FirebaseFirestore.instance.collection('Contents').doc(id);
  doc.update({'_like': _likes}).whenComplete(
      () => print('좋아요 업데이트 성공'));
}

LikeDeleteFunction(like, id, user) async {
  // 좋아요 삭제 기능
  List _likes = like;
  _likes.remove(user);
  var doc = FirebaseFirestore.instance.collection('Contents').doc(id);
  doc.update({'_like': _likes}).whenComplete(
      () => print('좋아요 삭제 업데이트 성공'));
}