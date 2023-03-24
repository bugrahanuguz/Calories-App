import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/components/login__register_page/have_account.dart';
import 'package:softito_final_project/components/login__register_page/signButton.dart';
import 'package:softito_final_project/components/login__register_page/text_field.dart';
import 'package:softito_final_project/viewmodel/login_view_model.dart';
import 'package:softito_final_project/views/login_page.dart';

import '../components/login__register_page/forgot_password.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onTap() {
      Navigator.pop(context);
    }

    signUserIn() async {
      print('basıldı');
      if (usernameController.text != null && passwordController.text != null) {
        var provider = Provider.of<LoginViewModel>(context, listen: false);
        await provider.signUp(usernameController.text, passwordController.text);
        print(usernameController.text + passwordController.text);
        print(provider.isRegister);
        if (provider.isRegister) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 50),
            //logo
            Lottie.asset('assets/images/login.json', height: 100),

            const SizedBox(height: 50),
            //username
            LoginTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false),
            //password
            const SizedBox(height: 50),
            LoginTextField(
                controller: passwordController,
                hintText: "password",
                obscureText: true),
            const SizedBox(height: 10),
            HaveAccount(
              ontap: onTap,
              text: 'Do you have an account? Sign In',
            ),

            const SizedBox(height: 10),
            SignButton(ontap: signUserIn, text: 'Sign Up'),

            //password check
          ]),
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
