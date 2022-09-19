import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chats/chats_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';

import '../../modules/feeds/feeds_screen.dart';
import '../../shared/components/constants.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

   SocialUserModel? model;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
         // print(value.data());
         model = SocialUserModel.fromJson(value.data());
         emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
          print(error.toString());
          emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  void changeBottomNav(int index){
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }
List<String> titles = [
  'TimeLine',
  'Chats',
  'Users',
  'Settings'
];
// Users Logout Method
  Future<bool> logOut() async {
    try {
      FirebaseAuth.instance.signOut();
      emit(SocialUserLogoutSuccessState());
      return true;
    } on FirebaseAuthException catch(error) {
      emit(SocialUserLogoutErrorState(error.toString()));
      return false;
    }
  }
}
