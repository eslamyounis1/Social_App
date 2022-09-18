import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/states.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit(): super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
}