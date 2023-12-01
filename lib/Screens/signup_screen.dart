import 'package:digital_wallet/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  // Map user = {};
  Database? database;

  List<Map> users = [];

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    CreateDataBase();
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
                "Sign Up",
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
                          "Name",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "name cant be Empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "enter Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cant be Empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline),
                          hintText: "enter E-mail",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Phone",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "phone cant be Empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "enter Phone",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
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
                      // TextFormField(
                      //   obscureText: false,
                      //   controller: passwordController,
                      //   keyboardType: TextInputType.visiblePassword,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Password cant be Empty";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(Icons.lock),
                      //     hintText: "enter password",
                      //     border: const OutlineInputBorder(),
                      //     suffix: IconButton(
                      //       iconSize: 15,
                      //       icon: Icon(passwordVisibility
                      //           ? Icons.visibility
                      //           : Icons.visibility_off),
                      //       onPressed: () {
                      //         setState(() {
                      //           passwordVisibility = !passwordVisibility;
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      txtFromField(
                        emailController: confirmPasswordController,
                        keybordType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cant be Empty";
                          }
                          return null;
                        },
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
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "confirm Your password",
                        obsecure: passwordVisibility,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(45, 54, 72, 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              Fluttertoast.showToast(
                                msg: "SignUp successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              insertToDatabase(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                              );
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) {
                                  return LoginScreen(
                                    users: users,
                                  );
                                }),
                              );
                            }
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
