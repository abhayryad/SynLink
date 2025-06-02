import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synlink_app/core/chat_page.dart';
import 'package:synlink_app/features/auth/presentation/pages/login_page.dart';
import 'package:synlink_app/features/auth/presentation/pages/register_page.dart';
import 'package:synlink_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:synlink_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:synlink_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:synlink_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:synlink_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:synlink_app/theme.dart';
// Make sure this path matches your project structure


void main() {
  final authRepository = AuthRepositoryImpl(authRemoteDataSource:  AuthRemoteDataSource());
  runApp(MyApp(authRepository: authRepository,));
}



class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  const MyApp({super.key, required this.authRepository});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            registerUseCase: RegisterUseCase(repository:authRepository ),
            loginUseCase: LoginUseCase(repository:authRepository),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'SynLink',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
        routes:{
          '/login': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
          '/chatPage':(_)=>ChatPage(),
          
        },
      ),
    );
  }
}
