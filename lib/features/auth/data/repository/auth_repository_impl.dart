import 'package:fpdart/fpdart.dart';
import 'package:my_blog/core/error/exceptions.dart';
import 'package:my_blog/core/error/failures.dart';
import 'package:my_blog/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:my_blog/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
          email: email, name: name, password: password);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
