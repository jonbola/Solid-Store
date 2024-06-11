import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "resources/images/img_logo.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 10),
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                  border: Border.all(color: Colors.indigo, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Fullname",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                  border: Border.all(color: Colors.indigo, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                  border: Border.all(color: Colors.indigo, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                  border: Border.all(color: Colors.indigo, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55),
                            bottomRight: Radius.circular(55),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 1.0,
                              offset: Offset(2.6, 2.6),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 60,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.indigo, width: 1.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(55),
                          bottomRight: Radius.circular(55),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE7EEF8),
                            blurRadius: 1.0,
                            offset: Offset(2.6, 2.6),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFE7EEF8),
                          blurRadius: 4.0,
                          offset: Offset(0.6, 0.7),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset("resources/images/img_google_logo.png"),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFE7EEF8),
                          blurRadius: 4.0,
                          offset: Offset(0.6, 0.7),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Image.asset("resources/images/img_facebook_logo.png"),
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
