import 'package:atm_mlm_app/view/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        // ignore: deprecated_member_use
        buttonColor: const Color(0xEFF7007C),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(const Color(0xEFF7007C)),
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.grey[300],
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
          ),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xEFF7007C)),
      ),
      home: const LoginPage(),
    );
  }
}
