import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/login_view_model.dart';
import 'package:softito_final_project/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: "burahanuuz@gmail.com");
    passwordController = TextEditingController(text: "12345678");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textField(
              usernameController,
              "Username",
              Icon(
                Icons.email,
                color: Colors.blue,
              ),
              false),
          const SizedBox(
            height: 25,
          ),
          _textField(
              passwordController,
              "Password",
              Icon(
                Icons.key_sharp,
                color: Colors.blue,
              ),
              true),
          const SizedBox(
            height: 25,
          ),
          _button(() async {
            if (usernameController.text != null &&
                passwordController.text != null) {
              var provider =
                  Provider.of<LoginViewModel>(context, listen: false);
              await provider.login(
                  usernameController.text, passwordController.text);
              if (provider.isLogin) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            }
          }, "Login"),
        ],
      )),
    );
  }
}

Widget _textField(TextEditingController conroller, String label,
        Widget prefixIcon, bool isText) =>
    TextField(
      obscureText: isText,
      obscuringCharacter: "*",
      controller: conroller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );

Widget _button(Function() onPressed, String text) {
  return text == "Login"
      ? ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.blue,
          )),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      : TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ));
}
