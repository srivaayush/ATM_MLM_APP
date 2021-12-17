import 'package:atm_mlm_app/auth/authentication.dart';
import 'package:atm_mlm_app/view/registration_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM MLM APP'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.2,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/i1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: <Widget>[
              // Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(8),
              //     child: const Text(
              //       'ATM MLM APP',
              //       style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 32),
              //     )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // MaterialButton(
              //   onPressed: () {
              //     //forgot password screen
              //   },
              //   textColor: Colors.blue,
              //   child: const Text('Forgot Password'),
              // ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xEFF7007C),
                                ),
                              ),
                    child: const Text('Login'),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);

                      //---------------------------------
                      //---------------------------------
                      AuthenticationHelper()
                          .signIn(
                              email: emailController.text,
                              password: passwordController.text)
                          .then(
                        (result) {
                          print('result issssssssssss $result');
                          if (result == null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result),
                              ),
                            );
                          }
                        },
                      );

                      //---------------------------------
                      //---------------------------------
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  MaterialButton(
                    textColor: Colors.blue,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
