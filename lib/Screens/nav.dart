// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:digital_wallet/Screens/transfere.dart';
import 'package:flutter/material.dart';

import 'package:digital_wallet/Screens/home_screen.dart';
import 'package:digital_wallet/Screens/login_screen.dart';

import 'Add_Beneficiary.dart';
import 'profilePage.dart';

class BottomBar extends StatefulWidget {
  List<Map> users;
  List<Map> data;
  BottomBar({
    Key? key,
    required this.users,
    required this.data,
  }) : super(key: key);
  @override
  BottomBarstate createState() => BottomBarstate();
}

class BottomBarstate extends State<BottomBar> {
  final List<Widget> _pages = [
    HomeScreen(),
    AddBeneficiaryPage(),
    TransferPage(
      cardNumber: '',
      name: '',
    ),
    ProfilePage()
  ];
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: 60,
              ),
              // const DrawerHeader(
              //   child: UserAccountsDrawerHeader(accountName: Text(""),accountEmail: Text("")),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(fontSize: 28),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomBar(
                              users: [],
                              data: [],
                            )));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(backgroundColor: Colors.blueGrey[900],),
                          body: ProfilePage(),
                        )
                    ));
                  },
                  leading: Icon(
                    Icons.person_pin,
                    size: 30,
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(backgroundColor: Colors.blueGrey[900],),
                          body: Center(child: AddBeneficiaryPage()),
                        )));
                  },
                  leading: const Icon(
                    Icons.person_add,
                    size: 30,
                  ),
                  title: const Text(
                    'Add Beneficiary',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(backgroundColor: Colors.blueGrey[900],),
                          body: TransferPage(cardNumber: '',name: ''),
                        )));
                  },
                  leading: const Icon(
                    Icons.compare_arrows_rounded,
                    size: 30,
                  ),
                  title: const Text(
                    'Transfer',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.blueGrey[800],
                              ),
                              body: LoginScreen(users: []),
                            )));
                  },
                  leading: const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(fontSize: 28),
                  ),
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
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFFED36A),
        backgroundColor: Color.fromRGBO(201, 203, 206, 0.6),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(201, 203, 206, 0.6),
            icon: Image.asset(
              'assets/images/home.png',
              width: 40,
              height: 40,
              color: Colors.black54,
            ),
            label: '',
            activeIcon: Image.asset(
              'assets/images/home.png',
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(201, 203, 206, 0.6),
            icon: Image.asset(
              'assets/images/add_account.png',
              width: 30,
              height: 30,
            ),
            label: '',
            activeIcon: Image.asset(
              'assets/images/add_account.png',
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(201, 203, 206, .6),
            icon: Image.asset(
              'assets/images/transfer.png',
              color: Colors.grey[700],
              width: 30,
              height: 30,
            ),
            label: '',
            activeIcon: Image.asset(
              'assets/images/transfer.png',
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(201, 203, 206, 0.6),
            icon: Image.asset(
              'assets/images/profile.png',
              width: 40,
              height: 40,
              color: Colors.black54,
            ),
            label: '',
            activeIcon: Image.asset(
              'assets/images/profile.png',
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
