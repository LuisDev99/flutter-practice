import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:random/menu_list/menu_list.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Alignment childAlignment = Alignment.center;

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        // Add state updating code
        setState(() {
          childAlignment = visible ? Alignment.topCenter : Alignment.center;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello Luis, Login")),
      body: Stack(
        //Using a stack soo that i can put an background image and lay the other widgets on top of it
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg4.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeOut,
            duration: Duration(
              milliseconds: 500,
            ),
            reverseDuration: Duration(
              milliseconds: 500,
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: childAlignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width:
                      300, //Give it a width soo that the textfield wont take the whole column space
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(height: 50), //Create a space between this two textboxs
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true, //Hide the password
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //Leave a space in this row
                  children: <Widget>[
                    Spacer(), //Add a spacer soo that the three buttons meet in the middle
                    MyButton(" Login "),
                    Spacer(),
                    MyButton(" Admin "),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign in with Facebook',
                        style: TextStyle(
                            fontFamily: 'DancingScript',
                            fontSize: 20,
                            color: Colors.blue[300] //Set a shader to this color
                            ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                Icon(Icons.vpn_key, color: Colors.green, size: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String _btnText;

  MyButton(this._btnText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuList()),
        );
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: EdgeInsets.all(14.0),
        child: Text(_btnText, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
