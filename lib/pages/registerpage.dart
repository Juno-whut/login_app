import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return 'Please fill in all fields';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
    );}
    catch (e) {
      return e;
    }
  }

  // dispose text controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],

        body:  SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      // welcom message
                      const SizedBox(height: 50),
                      const Text(
                        "Hello There",
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Register with your details below!", 
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
              
                      const SizedBox(height: 20),
                      // email text field
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  controller: _emailController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Please enter your email',
                                    )
                                ),
                              ),
                          ),
                      ),
              
                      const SizedBox(height: 25),
                      // password text field
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Please enter your password',
                                    )
                                ),
                              ),
                          )
                      ),
                      const SizedBox(height: 15),
                      // confirmpassword text field
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Please confirm your password',
                                    )
                                ),
                              ),
                          )
                      ),

                      const SizedBox(height: 15),
                      // Sign up button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: signUp,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),

                      const SizedBox(height: 15),
                      // redirect to sign in page if they are already a member
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "Already a Member?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: const Text(
                              "SignIn Now!",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          )
                        ],
                      )
                  ],
              ),
            )
        )
    );
  }
}