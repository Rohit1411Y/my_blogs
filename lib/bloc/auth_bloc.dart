import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      print('Authbloc called');
      final res = await _userSignUp(UserSignUpParams(
          email: event.email, password: event.password, name: event.name));
      print('res is $res');
      res.fold((l) => emit(AuthFailure(message: l.message)),
          (r) => emit(AuthSuccess(uid: r)));
    });
  }
}
