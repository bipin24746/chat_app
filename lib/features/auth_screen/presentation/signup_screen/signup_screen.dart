import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/router/app_router.gr.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerNumber = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    controllerFirstName.dispose();
    controllerLastName.dispose();
    controllerEmail.dispose();
    controllerNumber.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controllerFirstName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Enter First Name',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerLastName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Enter Last Name',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerNumber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Mobile Number',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Enter Email',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Enter Password',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerConfirmPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Confirm Password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: controllerEmail.text.toString(),
                          password: controllerPassword.text.toString())
                      .then((value) {})
                      .onError((error, stackTrace) {
                    Utils().toastMessage('This email is already registered');
                  });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already Have an Account?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(const LoginScreenRoute());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
