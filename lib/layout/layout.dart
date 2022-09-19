import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/local/cache_helper.dart';

class SocialAppLayout extends StatelessWidget {
  const SocialAppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Timeline'),
            ),
            body: ConditionalBuilder(
              condition: cubit.model != null,
              builder: (context) {
                // var model = FirebaseAuth.instance.currentUser?.emailVerified;
                // print(model);
                return Column(
                  children: [
                    // !model! ?
                    //   Container(
                    //     height: 70.0,
                    //     color: Colors.amber.withOpacity(0.6),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 20.0,
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           const Icon(
                    //             Icons.info_outline,
                    //           ),
                    //           const SizedBox(width: 15.0),
                    //           const Expanded(
                    //             child: Text(
                    //               'Please verify your Email',
                    //             ),
                    //           ),
                    //           // const Spacer(),
                    //           const SizedBox(
                    //             width: 20.0,
                    //           ),
                    //           defaultButton(
                    //             function: () {
                    //               FirebaseAuth.instance.currentUser!
                    //                   .sendEmailVerification()
                    //                   .then((value) {
                    //                 Fluttertoast.showToast(
                    //                     msg: 'check your mail inbox',
                    //                     backgroundColor: Colors.green);
                    //               }).catchError((error) {});
                    //             },
                    //             text: 'Send',
                    //             width: 80,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ) :
                    // TextButton(
                    //   onPressed: () {
                    //     cubit.logOut().then((value){
                    //       CacheHelper.clearDataFromSharedPreference(key: 'uid');
                    //       navigateAndFinish(
                    //         context,
                    //         const LoginScreen(),
                    //       );
                    //     }).catchError((error){});
                    //   },
                    //   child: const Text('Logout'),
                    // ),
                  ],
                );
              },
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
