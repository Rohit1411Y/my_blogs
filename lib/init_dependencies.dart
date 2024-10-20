import 'package:get_it/get_it.dart';
import 'package:my_blog/bloc/auth_bloc.dart';
import 'package:my_blog/core/secrets/app_secrets.dart';
import 'package:my_blog/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:my_blog/features/auth/data/repository/auth_repository_impl.dart';
import 'package:my_blog/features/auth/domain/repository/auth_repository.dart';
import 'package:my_blog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initdependencies() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}
