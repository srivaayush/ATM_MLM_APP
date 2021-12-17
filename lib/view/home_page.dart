import 'package:atm_mlm_app/auth/authentication.dart';
import 'package:atm_mlm_app/view/form_page.dart';
import 'package:atm_mlm_app/view/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM MLM APP'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.logout),
            onTap: () {
              try {
                AuthenticationHelper().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Unable to LogOut!'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Container(
        height: 200,
        width: 300,
        color: Colors.red,
        child: Column(
          children: const [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FormPage(),
            ),
          );
        },
        tooltip: 'Form',
        child: const Icon(Icons.add),
      ), // T
    );
  }
}
