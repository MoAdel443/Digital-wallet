import 'package:digital_wallet/Screens/nav.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'transfere.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<AddBeneficiaryPage> createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {

 String _selectedDate = DateFormat.yMd().format(DateTime(2023));
 Database ? database ;
 List<Map> data = [];

 void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2023),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _selectedDate = DateFormat.yMd().format(value);
        });
      }
    });
  }

   TextEditingController _nameController = TextEditingController();
   TextEditingController _cardController = TextEditingController();
  // final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Add Beneficiary',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 317,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Card Holder’s Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(fontSize: 22),
                    hintText: 'Enter Holder’s name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.green)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 317,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Card Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cardController,
                  decoration: InputDecoration(
                    // labelText: 'Card Number',
                    labelStyle: const TextStyle(fontSize: 22),
                    hintText: '2563 6636 9654 2145',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.green)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Expiry date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        setDate();
                      });
                    },
                    child: Text(
                      '$_selectedDate',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  insertToDatabase(cartNumber: int.parse(_cardController.text), exipryDate: _selectedDate, cartOwner: _nameController.text, balance: 150);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {

                      print(data);
                      return BottomBar(users: [],data: data,);


                    }),
                  );
                },
              );
            },
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(45, 54, 72, 1)),
                minimumSize: MaterialStatePropertyAll(Size(320, 50))),
            child: Text(
              'Add',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ],
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

 Future insertToDatabase({
   required int cartNumber,
   required String exipryDate,
   required String cartOwner,
   required int balance,
 }) async {
   return await database?.transaction((txn) async {
     await txn.rawInsert(
         'INSERT INTO Home(cartNumber,exipryDate,cartOwner,balance) VALUES("$cartNumber","$exipryDate","$cartOwner","$balance")');
   }).then((value) {
     print("data inserted successfully");
   }).catchError((error) {
     print("error $error");
   });
 }

 Future<List<Map>> getDataFromDatabase(database) async {
   return await database!.rawQuery('SELECT * from Home');
 }
}
