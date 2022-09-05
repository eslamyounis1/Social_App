import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

// Users Register Using Email And Password
  Future<String?> createUser(String email, String password) async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

// User Login Method Using Email And Password
  Future<String?> login(String email, String password) async {
    try {
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

// Users Login via Google third_party provider
  Future<String?> loginWithGoogle()async{
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _firebaseAuth.signInWithCredential(authCredential);
    final User? user = authResult.user;
    if(user != null){
      return '$user';
    }
    return null;
  }

// Users Logout Method
  Future<bool> logOut()async{
    try{
      googleSignIn.disconnect();
      _firebaseAuth.signOut();
      return true;
    }on FirebaseAuthException{
      return false;
    }
  }
}
