import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/sign_up/sign_up_cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

// Users Register Using Email And Password
  Future<String?> createUser(String email, String password,String phone,String name) async {
    emit(SocialRegisterLoadingState());
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCreate(
        uid: credential.user!.uid,
        phone: phone,
        email: email,
        name: name,

      );

      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: '$e');
      debugPrint(e.toString());
      emit(SocialRegisterErrorState(e.toString()));
    }
    return null;
  }

  Future<void> userCreate({
    required String name,
    required String email,
    required String phone,
    required String uid,

  }) async {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      bio: 'write your bio ....',
      image: 'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=996&t=st=1664011983~exp=1664012583~hmac=7beb90f4a40ae486e744ee343a88624bbfcbb539dec30e0a5cf78a7aec04dc64',
      cover: 'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=996&t=st=1664011983~exp=1664012583~hmac=7beb90f4a40ae486e744ee343a88624bbfcbb539dec30e0a5cf78a7aec04dc64',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
          emit(SocialCreateUserErrorState(error.toString()));
    });
  }

// Users Login via Google third_party provider
  Future<String?> loginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User? user = authResult.user;
    if (user != null) {
      return '$user';
    }
    return null;
  }

// // Users Logout Method
//   Future<bool> logOut() async {
//     try {
//       googleSignIn.disconnect();
//       _firebaseAuth.signOut();
//       return true;
//     } on FirebaseAuthException {
//       return false;
//     }
//   }

  final textFieldFocusNode = FocusNode();
  bool obscured = true;
  bool circular = false;

  void toggleObscured() {
    obscured = !obscured;
    if (textFieldFocusNode.hasPrimaryFocus) {
      return;
    }
    textFieldFocusNode.canRequestFocus = false;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
