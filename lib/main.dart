import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/layout.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/local/cache_helper.dart';

import 'layout/cubit/states.dart';
import 'modules/login/login_screen.dart';
import 'shared/styles/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();

  Widget widget;

  await CacheHelper.init();
   uid = CacheHelper.getDataFromSharedPreference(key: 'uid');

  if (uid != null) {
    widget = const SocialAppLayout();
  } else {
    widget = const LoginScreen();
  }
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({
    super.key,
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Social App',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },

      ),
    );
  }
}
