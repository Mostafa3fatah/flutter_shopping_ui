import 'package:flutter/material.dart';
import 'package:my_app/screen/home_screen.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({super.key});

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  bool haiddenPass = true;
  bool haiddenConfirmPass = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passContriller = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Create account',
                            style: TextStyle(
                                fontFamily: 'Suwannaphum',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Sign up get started',
                            style: TextStyle(
                              //fontFamily: 'Suwannaphum',
                              fontSize: 15,
                              color: const Color.fromARGB(132, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter you name';
                          }
                          return null;
                        },
                        controller: fullNameController,
                        decoration: InputDecoration(
                            labelText: 'Full name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email addres';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email addres',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }

                          return null;
                        },
                        controller: passContriller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: () {
                                TogglePass();
                              },
                              icon: Icon(haiddenPass
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        obscureText: haiddenPass,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }

                          if (value != passContriller.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                        controller: confirmpass,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.check),
                          suffixIcon: GestureDetector(
                            onTapDown: (_) {
                              setState(() {
                                haiddenConfirmPass = false;
                              });
                            },
                            onTapUp: (_) {
                              setState(() {
                                haiddenConfirmPass = true;
                              });
                            },
                            onTapCancel: () {
                              setState(() {
                                haiddenConfirmPass = true;
                              });
                            },
                            child: Icon(haiddenConfirmPass
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          // suffixIcon: IconButton(
                          //     onPressed: () {
                          //       ToggleConfirmPass();
                          //     },
                          //     icon: Icon(haiddenConfirmPass
                          //         ? Icons.visibility
                          //         : Icons.visibility_off)),
                          labelText: 'Confirm password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        obscureText: haiddenConfirmPass,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 5,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            String email = emailController.text;

                            String password = passContriller.text;
                            String confirmpassword = confirmpass.text;
                            print('Email: $email');
                            print('Password: $password');
                            print('Full name: $fullNameController');
                            print('Confirmpassword: $confirmpassword');
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHome()),
                              );
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text('Success'),
                                        content: Text(
                                            'Account created successfully'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Close'))
                                        ],
                                      ));
                            }
                          },
                          child: Text('sign up'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Aready member?'),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Log in',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  TogglePass() {
    haiddenPass = !haiddenPass;
    setState(() {});
  }

  ToggleConfirmPass() {
    haiddenConfirmPass = !haiddenConfirmPass;
    setState(() {});
  }
}
