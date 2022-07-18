import 'package:blogapp/features/screens/home/home.dart';
import 'package:blogapp/features/screens/login/presentasions/widgets/textfield_input_login.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/cubits/setup/setup_profile_cubit.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/page/onboarding_screen.dart';
import 'package:blogapp/widgets/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.authenticated
            ? const HomeScreens()
            : const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          const Text(
            'BLOGGER',
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 64,
          ),
          const EmailInput(),
          const SizedBox(
            height: 24,
          ),
          const PasswordInput(),
          ButtonDefault(
            title: 'Login',
            press: () {
              context.read<LoginCubit>().loginWithCredentials();
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OnboardingScreens.routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text('Don\'t have an account?'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    'Sign Up.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) {
        return previous.email != current.email;
      }),
      builder: (context, state) {
        return TextFieldInput(
            hintText: 'Enter your email',
            onchanged: (email) {
              context.read<LoginCubit>().emailChanged(email);
            },
            textInputType: TextInputType.emailAddress);
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) {
        return previous.password != current.password;
      }),
      builder: (context, state) {
        return TextFieldInput(
            hintText: 'Enter your password',
            onchanged: (password) {
              context.read<LoginCubit>().passwordChanged(password);
            },
            textInputType: TextInputType.text);
      },
    );
  }
}
