import 'package:flutter/material.dart';


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

  Future signUp() async {

  }

  // dispose text controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      // Sign in button
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
                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: const Text(
                              "Not a member?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                          const Text(
                            "Register Now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            )
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