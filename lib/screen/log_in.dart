import 'package:flutter/material.dart';
import 'package:my_app/screen/home_screen.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool haiddenPass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passContriller = TextEditingController();
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
                            'Welcome back',
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
                            'Enter your credential to continue.',
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
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email or username',
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
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget password..?',
                            style: TextStyle(
                                color: const Color.fromARGB(234, 158, 158, 158),
                                fontStyle: FontStyle.italic,
                                fontSize: 12),
                          ),
                        ),
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
                            print('Email : $email');
                            print('Password : $password');
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHome()),
                              );
                              SnackBar snackBar = SnackBar(
                                content: Text('Welcome Email'),
                                duration: Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text('LOG IN'),
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
              Text('Don\'t have accont?'),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign up',
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
}
