import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_assignment/main.dart';
import '../../Shared/constants.dart';
import '../../Shared/customRoute.dart';
import '../../services/caching.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String errorMessage="";

  TextEditingController rollNumberEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: height(context)*0.14,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOGO", style: TextStyle(fontSize: 50)),
                    const SizedBox(height: 20,),
                    const Text("Earnest Fintech Limited", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(height:  height(context)*0.06,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: const Border(),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blueAccent,
                                blurRadius: 1.0,
                                offset: Offset(0, 3)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Roll Number",
                              ),
                              validator: (val) => (val==null||val.isEmpty) ? 'Enter a roll number' : null,
                              controller: rollNumberEditingController,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: "Password",
                              ),
                              obscureText: true,
                              validator: (val) => (val==null||val.isEmpty) ?'Enter a password' : val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              controller: passwordEditingController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  customButton("Login", loginButton, width(context)*0.82),
                  const SizedBox(height: 10.0,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text(
                  //       "New Account?",
                  //       style: TextStyle(
                  //           color: Colors.grey
                  //       ),
                  //     ),
                  //     MaterialButton(
                  //       onPressed: () {
                  //         widget.toggleView();
                  //       },
                  //       highlightColor: Colors.transparent,
                  //       splashColor: Colors.transparent,
                  //       child: const Text(
                  //         "Sign Up",
                  //         style: TextStyle(
                  //             color: Colors.blueAccent
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 10.0,),
                  Text(
                    errorMessage,
                    style: TextStyle(
                        color: Colors.red[200]
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginButton() async{
    if(_formKey.currentState!.validate()){

      SharedPreferenceServices.saveUserLoggedInSharedPreference(true);
      SharedPreferenceServices.saveUserNameSharedPreference(rollNumberEditingController.text);
      SharedPreferenceServices.saveUserEmailSharedPreference(passwordEditingController.text);

      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(CustomRoute(page: MyHomePage(title: "")));

    }
  }

  // Future<Map<String, dynamic>> loginUser() async {
  //   String examLogin = dotenv.get('examLogin', fallback: "Error!");
  //   Map<String, String> data = {
  //     // "username": rollNumberEditingController.text,
  //     // "password": passwordEditingController.text,
  //     "username" : "INWBTEML00001",
  //     "password": "abcdef"
  //   };
  //   Map<String, dynamic> userData = {};
  //   await ApiService().fetchPost(context, examLogin, data).then((response) {
  //     userData = response;
  //   });
  //   return userData;
  // }

}