import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'page3.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});
  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var entryList = [];


  _SecondPageState(){
    var user = FirebaseAuth.instance.currentUser?.email;
    FirebaseDatabase.instance.ref().child('entries/${user?.substring(0, user.indexOf('@'))}').once()
        .then((datasnapshot){
          print('Successfully loaded data');
          print(datasnapshot.snapshot.key);
          print(datasnapshot.snapshot.value);
          var templst = [];
          datasnapshot.snapshot.children.forEach( (element) {
            print(element.key);
            print(element.value);
            templst.add(element.value);
          });
          print('Final List:');
          print(templst);
          entryList = templst;
          setState(() {
          });
        }).catchError((error){
          print('Failed to load data');
          print(error);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Entries'),
      ),
      body: ListView.builder(
        itemCount: entryList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 50,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey ),
            ),
            margin: EdgeInsets.only(left: 20,right: 20, top: 15, bottom: 10),
            child: Row(
              children: [
                Text('\u2022 ${entryList[index]}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ]
            ),
          );
        },
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Container(
        //       child: const Image(
        //         height: 200,
        //         image: NetworkImage('https://cdn.sanriowiki.com/3/38/My_Melody_happy.png'),
        //       ),
        //     ),


            // const Text(
            //   'screen 2',
            //   style: TextStyle(
            //     fontSize: 60,
            //     fontWeight: FontWeight.bold,
            //     fontStyle: FontStyle.italic,
            //     color: Colors.red
            //   ),
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // TextButton(
            //     onPressed: () {
            //       //todo
            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(builder: (context) => meow(title: 'page  :3',)),
            //       // );
            //     },
            //   child: Text('Button'),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       _incrementCounter();
            //     },
            //     child: Text('OthButton',
            //       style: TextStyle(color: Colors.blueGrey),
            //     ),
            // ),
          // ],
        ),
      );
      // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}