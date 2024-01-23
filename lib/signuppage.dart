import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp ({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  var UsernameController = TextEditingController();
  var PasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 40,
            child: Image(
                image: NetworkImage('https://sdl-stickershop.line.naver.jp/products/0/0/8/605/android/stickers/5408.png;compress=true')
            ),
          ),
          Expanded(
            flex: 50,
            child: Column(
              children: [
                const Text(
                  'SignUp',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: UsernameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserName',
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    )
                  ),
                ),

                ElevatedButton(
                    onPressed: (){
                      //Firebase Auth
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: UsernameController.text, password: PasswordController.text)
                          .then(
                              (value){
                                print('Signed upppp');
                                Navigator.pop(context);
                              })
                          .catchError((onError) {
                            print('FAILED');
                            print(onError.toString());
                      });

                    },
                    child: Text('SignUp')
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
