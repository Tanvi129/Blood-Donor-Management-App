import 'package:blood_donor/widgets/textFormField.dart';
import 'package:flutter/material.dart';

class SignUPScreen extends StatelessWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final sexController = TextEditingController();
    final btypeController = TextEditingController();
    final addressController = TextEditingController();
    final dobController = TextEditingController();
    final cpassController = TextEditingController();

    return Material(
      child: Container(
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
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                ),
              ),
              const Text(
                "and become a member",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: "Name",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        controller: phoneController,
                        hintText: "Phone Number",
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: sexController,
                        hintText: "Sex",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: btypeController,
                        hintText: "Blood Type",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: addressController,
                        hintText: "Address",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: dobController,
                        hintText: "Date of Birth",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: passController,
                        hintText: "Password",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: cpassController,
                        hintText: "Confirm Password",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
