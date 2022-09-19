// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:i_am_rich/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email must be not empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                    onChange: (value){
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    label: 'Password',
                    isPassword: password,
                    prefix: Icons.lock_outline,
                    suffix: password?Icons.visibility : Icons.visibility_off,
                    suffixPress: (){
                      setState((){
                        password = !password;
                      });
                    },
                    validate: (String? value){
                      if(value!.length<9){
                        return 'Password must be not less than 9 digits';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                    radius: 5.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an Account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
