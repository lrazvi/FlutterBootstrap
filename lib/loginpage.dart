import 'package:flutter/material.dart';
import 'main.dart';
import 'signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn ({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  @override
  var UsernameController = TextEditingController();
  var PasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(
            flex: 40,
            child: Image(
                image: NetworkImage('https://www.pngkey.com/png/detail/279-2791351_pin-by-crafty-annabelle-on-my-melody-printables.png')
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
              children: [
                const Text(
                  'LogIn',
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
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: UsernameController.text, password: PasswordController.text)
                      .then((value) {
                        print('LOGGED IN');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Horn Page',)),
                        );
                      }).catchError((onError){
                        print('FAILED TO LOGIN');
                        print(onError.toString());
                      });


                    },
                    child: Text('Login')
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                      //Firebase Auth
                      //FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
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
