// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:digital_wallet/Screens/receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'transfere.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Map> users=[];

  Database? database;
  List<Map> data = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "+ Add Card",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 23.0),
                  child: Text(
                    "Card",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 305.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.grey[700],
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 320.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.blueGrey[700],
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170.0, left: 23.0),

                  child: Text(
                    "1234 5678 9123 4567",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0, left: 27.0),
                  child: Text(
                    "10 / 27",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0, left: 250.0),
                  child: Text(
                    "Mr Mohamed ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Stack(
              children: [
                Container(
                  width: 180.0,
                  height: 130.0,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                  child: Icon(
                    Icons.credit_card_outlined,
                    size: 70.0,
                    color: Colors.grey[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 20.0),
                  child: Text(
                    "Your Balance",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, left: 20.0),
                  child: Text(
                    "\$ 180.00",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ReceiptScreen();
                      }),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          Icon(
                            Icons.list_alt,
                            size: 50.0,
                            color: Colors.grey[800],
                          ),
                        ],
                      ),
                      Text(
                        "Bill Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Scaffold(appBar:AppBar(backgroundColor: Colors.blueGrey[900],),body: TransferPage(cardNumber: "123456789123",name: "Mohamed",),);
                      }),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          Icon(
                            Icons.attach_money,
                            size: 50.0,
                            color: Colors.grey[800],
                          ),
                        ],
                      ),
                      Text(
                        "Bank Transfer",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Card(
              color: Colors.grey[200],
              child: ListTile(
                leading: Icon(Icons.network_cell),
                trailing: Text("- \$ 25.00"),
                title: Text("Netflex"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void CreateDataBase() async {
    database = await openDatabase(
      'wallet.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Home (id INTEGER PRIMARY KEY, cartNumber INTEGER, exipryDate TEXT , cartOwner TEXT,balance INTEGER)');
        print("db created");
      },
      onOpen: (db) {
        getDataFromDatabase(db).then((value) {
          data = value;
          print(data);
        }).catchError((error) {
          return error;
        });
        print("db opened");
      },
    );
  }


  Future<List<Map>> getDataFromDatabase(database) async {
    return await database!.rawQuery('SELECT * from Home');
  }
}
