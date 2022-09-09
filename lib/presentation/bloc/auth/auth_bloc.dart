import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:gym_manager_web_app/core/resources/pref_resources.dart';
import 'package:gym_manager_web_app/domain/model/auth_model.dart';
import 'package:gym_manager_web_app/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_login);
  }
  _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthInitial());
      emit(AuthLoading());
      await _auth.signInWithEmailAndPassword(
        email: event.credentials.username,
        password: event.credentials.password,
      );
      prefs.setBool(PrefResources.IS_LOGGED_IN, true);
      emit(AuthSucess());
    } on FirebaseAuthException catch (e) {
      emit(
        AuthError(error: e.code),
      );
    }
  }
}
