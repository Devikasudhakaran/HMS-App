import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/application/features/presentation/patient_list.dart';

import '../auth/authbloc/auth_bloc.dart';
import '../widgets/text_field.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLoginPressed(BuildContext context) {
    final username = _emailController.text.trim();
    final password = _passwordController.text.trim();
    context.read<AuthBloc>().add(SignInRequested(username: username, password: password));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamed(context, '/patient');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
  child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/img/splash_page.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/img/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment(-0.5,0),
              child: Container(
                child: Text("Login Or Register To Book\nYour Appointments",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              label: "Email",
              hint: "Enter your email",
              controller: _emailController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: "Password",
              hint: "Enter your Password",
              controller: _passwordController,
            ),
            const SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
    return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: state is AuthLoading
                      ? null
                      : () => _onLoginPressed(context),
                  child: state is AuthLoading
                      ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      : const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
  },
),
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text.rich(
                TextSpan(
                  text: 'By creating or logging into an account you are agreeing with our ',
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
),
    );
  }
}
