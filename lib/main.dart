import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/bloc/auth_bloc.dart';
import 'package:my_blog/core/theme/theme.dart';
import 'package:my_blog/features/auth/presentation/pages/login_page.dart';
import 'package:my_blog/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initdependencies();
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: AppTheme.darkThemeMode,
        home: const LoginPage());
  }
}
