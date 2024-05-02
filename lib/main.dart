import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( chat_app());
}
class chat_app extends StatelessWidget {
  const chat_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Chat_page.id:((context) => Chat_page()),
        'LoginPage': (context) => LoginPage(),
       RegisterPage.id:(context) => RegisterPage(),
      },
      home: LoginPage(),

    );
  }
}
