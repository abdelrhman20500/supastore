import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  GoogleSignInAccount? googleUser;
  Future<AuthResponse> googleSignIn() async {
    emit(SignInGoogleLoading());
    const webClientId = '91072029441-dairm877vcsksou4mfqu86nsvq1g0ori.apps.googleusercontent.com';
    /// ده لو هشتغل علي ايفون
    // const iosClientId = 'my-ios.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if(googleUser == null){
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(SignInGoogleFailure());
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    emit(SignInGoogleSuccess());
    return response;
  }

  Future<void> logout()async{
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      print(e.toString());
      emit(LogoutFailure());
    }
  }
}