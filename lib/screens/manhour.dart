import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManhourPage extends StatefulWidget {
  const ManhourPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ManhourPageState createState() => _ManhourPageState();
}

class _ManhourPageState extends State<ManhourPage> {
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

  void _handleFinger() async {
    if (kDebugMode) {
      print('OK, da nhan :)))');
    }
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manhour"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome " + _username + ". Please push finger here"),
            // RaisedButton(    //khong duoc ho tro nua
            //   onPressed: _handleLogout,
            //   child: const Text("Logout"),
            // ),
            ButtonBar(
              children: [
                Center(
                  child: ElevatedButton.icon(
                      onPressed: _handleFinger,
                      icon: const Icon(Icons.fingerprint),
                      label: const Text('Finger')),
                )
              ],
            ),
          ],
        ));
  }
}
