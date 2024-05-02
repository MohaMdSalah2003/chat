import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constants.dart';
import '../helper/show_snackbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(children: [
              Text(
                'Scholar Chat',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: ((data) {
                  email=data;
                  
                }),
                hintText: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: ((p0) {
                 password=p0; 
                }),
                hintText: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
              Custom_button(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await loginUser();
                      Navigator.pushNamed(context,Chat_page.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'user-not-found');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(context, "wrong-password");
                      }
                    } catch (ex) {
                      showSnackBar(context, 'there was an error');
                    }
                  } else {}
                },
                btn_name: 'Log in',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have and account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      ' REGISTER',
                      style: TextStyle(color: Color(0xffC7EDE6)),
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}


