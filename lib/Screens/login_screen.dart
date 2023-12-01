// ignore_for_file: must_be_immutable

import 'package:digital_wallet/Screens/signup_screen.dart';
import 'package:digital_wallet/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'nav.dart';

class LoginScreen extends StatefulWidget {
  List<Map> users;

  LoginScreen({super.key, required this.users});

  @override
  State<LoginScreen> createState() => _LoginScreenState(users: users);
}

class _LoginScreenState extends State<LoginScreen> {
  Database? database;
  List<Map> users = [];

  _LoginScreenState({required this.users});

  bool passwordVisibility = true;
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    CreateDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Center(
              heightFactor: 2,
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      txtFromField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email can't be empty!";
                            }
                            return null;
                          },
                          emailController: emailController,
                          keybordType: TextInputType.emailAddress,
                          hintText: 'Enter Your Email',
                          prefixIcon: const Icon(Icons.mail_outline)),
                      const SizedBox(
                        height: 35.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      txtFromField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can't be empty!";
                          }
                          return null;
                        },
                        emailController: passwordController,
                        keybordType: TextInputType.visiblePassword,
                        hintText: 'Enter Your password',
                        obsecure: passwordVisibility,
                        prefixIcon: const Icon(Icons.lock),
                        suffex: IconButton(
                          icon: Icon(passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisibility = !passwordVisibility;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 55.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(45, 54, 72, 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            print(users);
                            if (formKey.currentState!.validate()) {
                              for (int i = 0; i < users.length; i++) {
                                if (users[i]['email'] == emailController.text &&
                                    users[i]['password'] ==
                                        passwordController.text) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (c) {
                                      return BottomBar(
                                        users: users,
                                        data: [],
                                      );
                                    }),
                                  );
                                  print('email:   ' + emailController.text);
                                  print('password: ' + passwordController.text);
                                } else {
                                  print('no access');
                                }
                              }
                            }
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (c) {
                                  return SignupScreen();
                                }),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.0,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ]),
        ));
  }

  void CreateDataBase() async {
    database = await openDatabase(
      'wallet.db',
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Home (id INTEGER PRIMARY KEY, cartNumber INTEGER, exipryDate TEXT , cartOwner TEXT,balance INTEGER)');
        await db.execute(
            'CREATE TABLE User (name TEXT, email TEXT, phone TEXT, password TEXT)');

        print("db created");
      },
      onOpen: (db) {
        getDataFromDatabase(db).then((value) {
          users = value;
          print(users);
        }).catchError((error) {
          return error;
        });
        print("db opened");
      },
    );
  }

  Future insertToDatabase({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await database!.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO User(name,email,phone,password) VALUES("$name","$email","$phone","$password")');
    }).then((value) {
      print("data inserted successfully");
    }).catchError((error) {
      print("error $error");
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database!.rawQuery('SELECT * from User');
  }
}
