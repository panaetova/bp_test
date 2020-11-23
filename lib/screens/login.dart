import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email;
  String password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Widget makeLogo() {
      return Container(
          padding: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Text('ToDoApp', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
              ),
      );
    }

    Widget inputForm(Icon icon, String hint, TextEditingController controller, bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          obscureText: obscure,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white24, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white24),
              hintText: hint,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.white24),
                  child: icon,
                ),
              )
          ),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }

    Widget buttonForm(String label, void func()) {
        return RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Colors.amber,
          color: Colors.white,
          onPressed: () {func();},
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor),),
      );
    }

    Widget makeForm(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: inputForm(Icon(Icons.email_outlined), 'EMAIL', emailController, false),),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: inputForm(Icon(Icons.lock), 'PASSWORD', passController, true),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: buttonForm(label, func),
            )
          ],
        ),
      );
    }

  void buttonAction() {
      email = emailController.text;
      password = passController.text;

      emailController.clear();
      passController.clear();
  }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          makeLogo(),
          (showLogin ? Column(
            children: <Widget> [
              makeForm('LOGIN', buttonAction),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                  child: Text('Don\'t have an account? Register here!', style: TextStyle(color: Colors.white, fontSize: 20)),
                  onTap: () {
                    setState(() {
                      showLogin = false;
                    });
                  }
                ),
              )
            ],
          )
          : Column(
            children: <Widget> [
              makeForm('REGISTER', buttonAction),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                    child: Text('Login here!',  style: TextStyle(color: Colors.white, fontSize: 20)),
                    onTap: () {
                      setState(() {
                        showLogin = true;
                      });
                    }
                ),
              )
            ],
          )
          )
    ],
    )
    );
  }
}
