import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/application/features/auth/authbloc/auth_bloc.dart';
import 'package:hms/application/features/presentation/login_screen.dart';
import 'package:hms/application/features/presentation/patient_list.dart';
import 'package:hms/application/features/presentation/register_screen.dart';
import 'package:hms/application/features/presentation/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthBloc())
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/login':(context)=> const LoginPage(),
          '/patient': (context) => const PatientList(),
          '/register': (context) => const RegisterScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'HMS App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      //  home: const SplashPage(),
      ),
    );
  }
}

