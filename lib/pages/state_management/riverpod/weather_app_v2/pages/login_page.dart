import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/pages/weather_home_page_v2.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/providers/provider.dart';
import 'package:get/get.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _fKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      ref.read(authProvider.notifier).tryAutoLogin();
    });
    super.initState();
  }

  void submit() {
    setState(() => _autovalidateMode = AutovalidateMode.always);
    final form = _fKey.currentState;

    if (!form!.validate()) return;

    form.save();
    if (ref.read(appConfigProvider).state.buildFlavor == 'dev') {
      print('email: $email, password: $password');
    }

    ref.read(authProvider.notifier).login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (AuthState state) {
      if (ref.read(appConfigProvider).state.buildFlavor == 'dev') {
        print('---- state ----');
        print('authenticated: ${state.authenticated}');
        print('logginIn: ${state.loggingIn}');
        print('tryingAutoLogin: ${state.tryingAutoLogin}');
        print('error: ${state.error}');
      }
      if (state.authenticated == true) {
        // Navigator.pushReplacementNamed(context, HomePage.routeName);
        Get.to(WeatherHomePageV2());
      }
      if (state.error.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(state.error),
            );
          },
        );
      }
    });
    return Scaffold(
      body: buildBody(
        ref.watch(authStateProvider),
      ),
    );
  }

  Widget buildBody(AuthState authState) {
    if (authState.tryingAutoLogin) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (authState.authenticated) {
      return Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _fKey,
        autovalidateMode: _autovalidateMode,
        child: ListView(
          children: [
            SizedBox(height: 100.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              validator: (val) {
                val = val!.trim();
                if (val.isEmpty) {
                  return 'Email required';
                }
                if (!val.contains('@')) {
                  return 'Invalid email';
                }
                return null;
              },
              onSaved: (val) => email = val!,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              validator: (val) {
                val = val!.trim();
                if (val.isEmpty) {
                  return 'Password required';
                }
                if (val.length < 6) {
                  return 'Password must be longer than 6';
                }
                return null;
              },
              onSaved: (val) => password = val!,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submit,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: authState.loggingIn
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
