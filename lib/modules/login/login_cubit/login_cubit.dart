import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/modules/login/login_cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>{
  SocialLoginCubit() : super(SocialLoginInitialState());
  static SocialLoginCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String?> login(String email, String password) async {
    emit(SocialLoginLoadingState());
    try {
      UserCredential credential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SocialLoginSuccessState(credential.user!.uid));
      return credential.user!.email;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: '$e');
      emit(SocialLoginErrorState(e.toString()));
    }
    return null;
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

  final textFieldFocusNode = FocusNode();
  bool obscured = true;
  bool circular = false;


  void toggleObscured() {
    obscured = !obscured;
    if (textFieldFocusNode.hasPrimaryFocus) {
      return;
    }
    textFieldFocusNode.canRequestFocus = false;
    emit(SocialLoginChangePasswordVisibilityState());
  }
}