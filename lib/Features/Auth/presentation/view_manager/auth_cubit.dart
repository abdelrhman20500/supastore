import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitial());
  /// instance from supabase...
  SupabaseClient client = Supabase.instance.client;

  Future<void> userLogin({required String email, required String password})async{
    emit(LoginLoading());
    try{
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    }on AuthException catch(e){
      emit(LoginFailure(errMessage: e.message));
    }catch(e){
      print(e.toString());
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
  Future<void> userRegister({required String name, required String email,
    required String password})async{
    emit(RegisterLoading());
    try{
      await client.auth.signUp(email: email, password: password);
      emit(RegisterSuccess());
    }on AuthException catch(e){
      emit(RegisterFailure(errMessage: e.message));
    }catch(e){
      print(e.toString());
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }

}