import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supastore/Features/Auth/data/model/user_model.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitial());
  /// instance from supabase...
  SupabaseClient client = Supabase.instance.client;
  /// Login .....
  Future<void> userLogin({required String email, required String password})async{
    emit(LoginLoading());
    try{
      await client.auth.signInWithPassword(email: email, password: password);
      await getUserData();
      emit(LoginSuccess());
    }on AuthException catch(e){
      emit(LoginFailure(errMessage: e.message));
    }catch(e){
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
  /// Register ......
  Future<void> userRegister({required String name, required String email,
    required String password})async{
    emit(RegisterLoading());
    try{
      await client.auth.signUp(email: email, password: password);
      await addUserData(name: name, email: email);
      await getUserData();
      emit(RegisterSuccess());
    }on AuthException catch(e){
      emit(RegisterFailure(errMessage: e.message));
    }catch(e){
      print(e.toString());
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
  /// Sign in With Google .....
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
    await addUserData(name: googleUser!.displayName!, email: googleUser!.email);
    await getUserData();
    emit(SignInGoogleSuccess());
    return response;
  }
  /// Logout .....
  Future<void> logout()async{
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure());
    }
  }
  /// Reset Password ......
  Future<void> resetPassword({required String email})async{
    emit(ResetPasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    }catch (e) {
     emit(ResetPasswordFailure()
     );
    }
  }
  /// UserData .....
  Future<void> addUserData({required String name, required String email}) async {
    if (isClosed) return;
    emit(UserDataLoading());
    try {
      await client.from('users').upsert({
        "user_id": client.auth.currentUser?.id,
        "name": name,
        "email": email,
      });
      if (!isClosed) emit(UserDataSuccess());
    } catch (e) {
      print(e.toString());
      if (!isClosed) emit(UserDataFailure());
    }
  }

   UserModel? userModel;
  Future<void> getUserData()async{
    emit(GetUserDataLoading());
    try{
      final data = await client
          .from('users')
          .select().eq("user_id", client.auth.currentUser!.id);
      userModel  = UserModel(
          userId: data[0]["user_id"],
          name: data[0]["name"],
          email: data[0]["email"]);
      print("##########################");
      print(data);
      emit(GetUserDataSuccess());
    }catch(e){
      print(e.toString());
      emit(GetUserDataFailure());
    }
  }
}



