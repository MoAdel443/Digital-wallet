import 'package:flutter/material.dart';

import 'nav.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BottomBar(users: [],data: [],)));
                },
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'LogOut',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [Image.asset('assets/images/bell.png')],
        backgroundColor: Color.fromRGBO(45, 54, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                  child: Text(
                "My Receipt",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
              )),
            ),
            const SizedBox(
              height: 55.0,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 450.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35.0,
                      child: Icon(
                        Icons.safety_check_rounded,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Center(
                      child: Text(
                    "Transfare Done",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 150.0, left: 10.0, right: 10.0),
                  child: Center(
                      child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black45,
                  )),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 170.0, left: 20.0, right: 10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30.0,
                            )),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Title",
                              style: TextStyle(color: Colors.grey[100]),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Mohamed Adel",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 270.0, left: 20.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Number",
                        style: TextStyle(color: Colors.grey[100]),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "1234 5678 9123 4567",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 350.0, left: 20.0, right: 10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(color: Colors.grey[100]),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "20000",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transfare Fee",
                            style: TextStyle(color: Colors.grey[100]),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "1234 ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35.0,
            ),
            MaterialButton(
              onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BottomBar(users: [], data: []);
                    }),
                  );

              },
              shape: StadiumBorder(side: BorderSide(width: 1)),
              height: 40.0,
              color: Colors.blueGrey[800],
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
