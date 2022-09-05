import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../shared/firebase_auth.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  late FirebaseAuthentication auth;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Log in",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 420,
              margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              //Hides label on focus or if filled
                              filled: true,
                              // Needed for adding a fill color
                              fillColor: const Color(0xff50C4ED).withOpacity(0),
                              isDense: true,
                              // Reduces height a bit
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // No border
                                borderRadius: BorderRadius.circular(
                                    12), // Apply corner radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 110,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(0xffd9d9d9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: _pwdController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              focusNode: textFieldFocusNode,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor:
                                    const Color(0xff50C4ED).withOpacity(0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured,
                                    child: Icon(
                                      _obscured
                                          ? Iconsax.eye_slash
                                          : Iconsax.eye,
                                      size: 25,
                                      color: const Color(0xff3B999B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        const Text(
                          "You do not have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Create account!",
                            style: TextStyle(
                                color: Color(0xff3B999B),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const <Widget>[
                        Text(
                          "By log in, you are accepting our Terms",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff3B999B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0.0),
                      onPressed: () {
                        var userId = '';
                        auth.login(_emailController.text, _pwdController.text).then((value){
                          if(value == null) {
                            debugPrint('Login Error');
                          }else{
                            userId = value;
                            debugPrint('$userId successfully logged in');
                          }
                        });
                      },
                      child: circular
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Log in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                auth.loginWithGoogle().then((value){
                  if(value == null){
                    debugPrint('Error signing In with google');
                  }else{
                    debugPrint('$value successfully Logged in with google');
                  }
                });
              },
              child: Container(
                width: 350.0,
                decoration: BoxDecoration(
                    color: const Color(0xff4285F4),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_login.png',
                      height: 60.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
