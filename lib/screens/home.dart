import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _username;

  @override
  void initState() {
    super.initState();
    _loadUserInfo().whenComplete(() {
      if (kDebugMode) {
        // print('ok nek');
      }
      setState(() {});
    });
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = (prefs.getString('username') ?? "");
  }

  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    //Navigator.pushNamed(context, '/login');
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome " + _username + ". List Item"),
            // RaisedButton(    //khong duoc ho tro nua
            //   onPressed: _handleLogout,
            //   child: const Text("Logout"),
            // ),
            ElevatedButton(
              onPressed: _handleLogout,
              child: const Text("Logout"),
            ),
          ],
        ));
  }
}
