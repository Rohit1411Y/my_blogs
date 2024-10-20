import 'package:fpdart/fpdart.dart';
import 'package:my_blog/core/error/failures.dart';
import 'package:my_blog/core/usecase/usecase.dart';
import 'package:my_blog/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
  return  await  authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams(
      {required this.email, required this.password, required this.name});
}
