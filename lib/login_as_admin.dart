import 'package:flutter/material.dart';
import 'package:parkease/admindashboard.dart';

class LoginAsAdmin extends StatefulWidget {
  const LoginAsAdmin({super.key});

  @override
  State<LoginAsAdmin> createState() => _LoginAsAdminState();
}

class _LoginAsAdminState extends State<LoginAsAdmin> {
  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 98, 190, 236),
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 60, left: 10, bottom: 30, right: 10),
              // padding:const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 90,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextField(
                        controller: UsernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.05),
                          filled: true,
                          icon: Icon(Icons.person),
                          hintText: 'Username',
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextField(
                        controller: EmailController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.05),
                          filled: true,
                          icon: Icon(Icons.email),
                          hintText: 'Email',
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextField(
                      obscureText: !isVisible,
                      controller: PasswordController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(.05),
                        filled: true,
                        icon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            //in here we will create a click to show and hide the password a toggle button
                            setState(() {
                              //toggle button
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 98, 190, 236),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // child: ElevatedButton(
                    child: TextButton(
                      onPressed: () {
                        if (UsernameController.text == 'admin' &&
                            EmailController.text == 'admin123@gmail.com' &&
                            PasswordController.text == '123') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Myadmin()),
                            // MaterialPageRoute(builder: (context) => navData[0]),
                          );
                        } else {
                          // Show an error message or handle invalid credentials
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Invalid Credentials'),
                                content: Text(
                                    'Please check your username, email and password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
