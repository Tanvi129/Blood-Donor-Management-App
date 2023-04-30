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
        constraints: const BoxConstraints.expand(),
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
              const SizedBox(
                height: 60,
              ),
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
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Already a member ?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: passController,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/navbar");
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 50)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, "/signup");
                    }),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: (() {
                  
                }),
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
