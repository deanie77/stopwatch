import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loggedIn = false;
  late String name;

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    setState(() {
      loggedIn = true;
      name = _nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.check,
          color: Colors.orangeAccent,
        ),
        Text('Hi $name'),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                  text!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter the runner\'s email.';
                }

                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Continue'),
              onPressed: _validate,
            ),
          ],
        ),
      ),
    );
  }
}
