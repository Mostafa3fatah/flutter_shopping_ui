import 'package:flutter/material.dart';
import 'package:my_app/screen/log_in.dart';
import 'package:my_app/screen/sign_up.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  State<MyWelcome> createState() => _MyWelcometState();
}

class _MyWelcometState extends State<MyWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        title: Text(
          'Shop Ease',
          style: TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(106, 0, 0, 0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/image/Online_shopping.jpg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: Image.network(
                    'https://i.pinimg.com/1200x/73/3f/78/733f787fc774c95712c980536e62cce3.jpg',
                    height: 52,
                    width: 52,
                    excludeFromSemantics: true,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -8))
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Let\'s \nget started',
                        style: TextStyle(
                            fontFamily: 'Suwannaphum',
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(179, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Everything start from here ',
                        style: TextStyle(
                            //fontFamily: 'Suwannaphum',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromARGB(172, 71, 71, 71)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLogin()),
                              );
                            },
                            child: Text('Log In'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                                foregroundColor: Colors.white70),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mysignup()));
                            },
                            child: Text('Sign up'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
