import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _autovalidate = false;
  late String _email, _password;

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() async {
    final FormState? form = _formKeyLogin.currentState;
    if (!form!.validate()) {
      // _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please check validate before submitting.');
    } else {
      form.save();
      if (_password == "111111") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("username", _email);
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', ModalRoute.withName('/home'));
      } else {
        showInSnackBar('Incorrect credentials');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: _formKeyLogin,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    key: const Key("_mobile"),
                    decoration: const InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ButtonBar(
                    children: <Widget>[
                      ElevatedButton.icon(
                          onPressed: _handleSubmitted,
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Sign in')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
