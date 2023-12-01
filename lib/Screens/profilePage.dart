import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/R.png',
            height: 200,
          ),
        ),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              Image.asset('assets/images/Line 1.png'),
            ],
          ),
          subtitle: Text(
            'Abdullah',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          trailing: Image.asset('assets/images/icon-edit.png'),
        ),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              Image.asset('assets/images/Line 1.png'),
            ],
          ),
          subtitle: Text(
            'Abdullah@gmail.com',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          trailing: Image.asset('assets/images/icon-edit.png'),
        ),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Password'),
              Image.asset('assets/images/Line 1.png'),
            ],
          ),
          subtitle: Text(
            '********',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          trailing: Image.asset('assets/images/icon-edit.png'),
        ),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account Number'),
              Image.asset('assets/images/Line 1.png'),
            ],
          ),
          subtitle: Text(
            '2563 6636 9654 2145',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          trailing: Image.asset('assets/images/icon-edit.png'),
        ),
      ],
    );
  }
}
