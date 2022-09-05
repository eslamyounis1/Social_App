import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_app/shared/firebase_auth.dart';

import '../login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  bool circular = false;

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

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
          title: const Text(
            "Create account",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/left.svg",
              color: Colors.black,
              height: 24,
              width: 24,
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 70,
          ),
          Container(
              height: 405,
              margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  SizedBox(
                    height: 100,
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
                                filled: true,
                                fillColor:
                                    const Color(0xff50C4ED).withOpacity(0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
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
                              keyboardType: TextInputType.visiblePassword,
                              controller: _pwdController,
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
                                          ? Iconsax.eye
                                          : Iconsax.eye_slash,
                                      size: 20,
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
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        const Text(
                          "You have an account?",
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
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            "Log in!",
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
                          "By creating an account, you are accepting our Terms",
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
                        auth.createUser(_emailController.text, _pwdController.text).then((value){
                          if(value == null){
                            debugPrint('Registration Error');
                          }else{
                            userId = value;
                            debugPrint('$userId successfully Registered');
                          }
                        });
                      },
                      child: circular
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Create an account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
