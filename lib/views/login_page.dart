import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/components/login__register_page/forgot_password.dart';
import 'package:softito_final_project/components/login__register_page/login_google.dart';
import 'package:softito_final_project/components/login__register_page/login_to_register.dart';
import 'package:softito_final_project/components/login__register_page/signButton.dart';
import 'package:softito_final_project/components/login__register_page/text_field.dart';
import 'package:softito_final_project/viewmodel/login_view_model.dart';
import 'package:softito_final_project/views/home_page.dart';
import 'package:softito_final_project/views/register_page.dart';
import 'package:softito_final_project/views/reset_password_page.dart';

import '../components/login__register_page/or_continue_with.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController(text: "bugra@bugra.com");

  final passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    signUserIn() async {
      print('basıldı');
      if (usernameController.text != null && passwordController.text != null) {
        var provider = Provider.of<LoginViewModel>(context, listen: false);
        await provider.login(usernameController.text, passwordController.text);
        print(usernameController.text + passwordController.text);
        print(provider.isLogin);
        if (provider.isLogin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
    }

    toRegister() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    }

    return Scaffold(
      backgroundColor: Color(0xffFFEAEA),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 50),
              //logo

              Lottie.asset(
                'assets/images/login.json',
                height: 100,
              ),

              const SizedBox(height: 50),
              //username
              LoginTextField(
                  controller: usernameController,
                  hintText: "E-mail",
                  obscureText: false),
              //password
              const SizedBox(height: 50),
              LoginTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),

              //Forgot password
              const SizedBox(height: 10),
              ForgotPassword(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResetPassword()));
                },
                text: 'Forgot password?',
              ),

              //login button
              const SizedBox(height: 10),
              SignButton(ontap: signUserIn, text: 'Sign in'),

              //or continue with
              // const SizedBox(height: 50),
              // const OrContinueWith(text: 'Or continue with'),
              // //google button
              // const SizedBox(height: 50),
              // const LoginGoogle(
              //   imagePath: 'assets/images/google_icon.png',
              // ),

              //not a member? register here
              const SizedBox(height: 50),
              LoginToRegister(
                ontap: toRegister,
              )
            ]),
          ),
        ),
      ),
    );
  }
}



//     Scaffold(
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _textField(
//               usernameController,
//               "Username",
//               Icon(
//                 Icons.email,
//                 color: Colors.blue,
//               ),
//               false),
//           const SizedBox(
//             height: 25,
//           ),
//           _textField(
//               passwordController,
//               "Password",
//               Icon(
//                 Icons.key_sharp,
//                 color: Colors.blue,
//               ),
//               true),
//           const SizedBox(
//             height: 25,
//           ),
//           _button(() async {
//             if (usernameController.text != null &&
//                 passwordController.text != null) {
//               var provider =
//                   Provider.of<LoginViewModel>(context, listen: false);
//               await provider.login(
//                   usernameController.text, passwordController.text);
//               if (provider.isLogin) {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HomePage()));
//               }
//             }
//           }, "Login"),
//         ],
//       )),
//     );
//   }
// }

// Widget _textField(TextEditingController conroller, String label,
//         Widget prefixIcon, bool isText) =>
//     TextField(
//       obscureText: isText,
//       obscuringCharacter: "*",
//       controller: conroller,
//       decoration: InputDecoration(
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//               borderRadius: BorderRadius.circular(20)),
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.blue),
//           prefixIcon: prefixIcon,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//     );

// Widget _button(Function() onPressed, String text) {
//   return text == "Login"
//       ? ElevatedButton(
//           style: ButtonStyle(
//               backgroundColor: MaterialStatePropertyAll(
//             Colors.blue,
//           )),
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         )
//       : TextButton(
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ));