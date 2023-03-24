import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/reset_password.dart';
import 'package:softito_final_project/views/login_page.dart';

import '../components/login__register_page/signButton.dart';
import '../components/login__register_page/text_field.dart';

class ResetPassword extends StatelessWidget {
  final emailController = TextEditingController();
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    resetPassword() async {
      print('basıldı');
      if (emailController.text != null) {
        var provider =
            Provider.of<ResetPasswordViewModel>(context, listen: false);
        await provider.resetPasswordFunc(emailController.text);
        print(emailController.text);
        print(provider.isRegister);
        if (provider.isRegister) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Please check your Email! Please fill in the blanks.",
            style: TextStyle(color: Colors.white),
          )));
        }
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffFFEAEA),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Center(
          child: Column(children: [
            const SizedBox(height: 50),
            //logo
            Lottie.asset('assets/images/forgot_password.json', height: 100),

            const SizedBox(height: 50),
            //username
            LoginTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),
            //password

            const SizedBox(height: 50),
            SignButton(ontap: resetPassword, text: 'Send Email'),

            //password check
          ]),
        ),
      )),
    );
  }

  resetPassword() {}
}
