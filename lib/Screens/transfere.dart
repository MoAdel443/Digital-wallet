// ignore_for_file: must_be_immutable

import 'package:digital_wallet/Screens/nav.dart';
import 'package:flutter/material.dart';
import 'receipt_screen.dart';

class TransferPage extends StatefulWidget {
  String name, cardNumber;
  TransferPage({
    Key? key,
    required this.name,
    required this.cardNumber,
  }) : super(key: key);

  @override
  State<TransferPage> createState() =>
      _TransferPageState(cardNumber: cardNumber, name: name);
}

class _TransferPageState extends State<TransferPage> {
  String name, cardNumber;
  final TextEditingController _reasonController = TextEditingController();
  _TransferPageState({required this.name, required this.cardNumber});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40),
            child: Text(
              'Transfer Money',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            )),
        ListTile(
          title: Text(
            "Amount",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          subtitle: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: const TextStyle(fontSize: 22),
              hintText: '2000',
              border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.green, width: 45)),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          title: Text(
            "Card Number",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          subtitle: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: const TextStyle(fontSize: 22),
              hintText: '$cardNumber',
              border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.green, width: 45)),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          title: Text(
            "Choose A Reason",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          subtitle: DropdownMenu(
            width: 360,
            textStyle: TextStyle(fontSize: 18),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 'family', label: 'Family'),
              DropdownMenuEntry(value: 'work', label: 'Work'),
            ],
            hintText: 'Family',
            controller: _reasonController,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          title: Text(
            "Messege",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          subtitle: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelStyle: const TextStyle(fontSize: 22),
              hintText: '$cardNumber',
              border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.green, width: 45)),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              setState(
                    () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ReceiptScreen();
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
              'Send Money',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
