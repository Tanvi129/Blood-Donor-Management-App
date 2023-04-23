import 'package:blood_donor/widgets/textFormField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Material(
      child: Container(
        // height: double.infinity,
        constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DROP",
                    style: TextStyle(color: Colors.black, fontSize: 45),
                  ),
                  Image.asset('assests/images/appIcon.png')
                ],
              ),
              const Text(
                "Already a member ?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.datetime,
                        obscureText: false,
                      ),
                      CustomTextField(
                        controller: passController,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 50)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
