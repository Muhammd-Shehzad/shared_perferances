import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TO-DO Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'email',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setStringList('email', <String>['${email.text}']);

                  // await prefs.setString('email', email.text);
                  // await prefs.setString('password', password.text);

                  print('Email: ${email.text}  ');
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(96, 125, 139, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // String? localdatabaseemail = prefs.getString("email");
                  // String? localdatabasepass = prefs.getString("password");
                  final List<String>? item = prefs.getStringList('email');
                  print('email:$item');

                  // print(
                  //     'email: $localdatabaseemail password: $localdatabasepass');
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Show',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
//  Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Container(
//                             color: Colors.grey,
//                             child: Column(
//                               children: [
                                
//                                 SizedBox(
//                                   height: 20.h,
//                                 ),
//                                 InkWell(
//                                   onTap: () async {
//                                     if (search.text.isEmpty) {}
//                                   },
//                                   child: Container(
//                                     height: 50.h,
//                                     width: 100.w,
//                                     decoration: BoxDecoration(
//                                         color: Colors.blueGrey,
//                                         border: Border.all(
//                                           color: Colors.white,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: Center(
//                                       child: Text(
//                                         'Save',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),TextField(
                            