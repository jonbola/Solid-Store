import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../database/helper/db_helper.dart';
import '../main_page.dart';
import '../register/signin_page.dart';
import '../../admin/page//admin_mainpage.dart';

class LoginPage extends StatefulWidget {
  final bool visionStatus;
  const LoginPage(this.visionStatus, {super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool visionStatus;
  final useremail = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;
  bool isLoginTrue = false;
  final DatabaseHelper dbHelper =
      DatabaseHelper(); // Create an instance of DatabaseHelper

  @override
  void initState() {
    super.initState();
    visionStatus = widget.visionStatus;
    clearSession(); // Clear any existing session when the page loads
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userEmail');
    await prefs.remove('userRole');
    print('Session cleared');
  }

  Future<void> login() async {
    print('Attempting to log in with email: ${useremail.text}');
    var response = await dbHelper.login(
        useremail.text, password.text); // Use the instance to call the method
    print('Login response: $response');
    if (response != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', useremail.text);
      await prefs.setString(
          'userRole', response['role']); // Save user role in shared preferences

      if (!mounted) return;

      // Navigate based on the user's role
      if (response['role'] == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const AdminMainpage()), // Navigate to AdminHomeWidget
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MainPage(true, false)), // Navigate to HomeWidget
        );
      }
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  void _validateAndLogin() {
    final email = useremail.text;
    final passwordText = password.text; // Renamed local variable

    // Simple email validation regex
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    if (email.isEmpty || passwordText.isEmpty) {
      setState(() {
        isLoginTrue = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
    } else if (!emailRegex.hasMatch(email)) {
      setState(() {
        isLoginTrue = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email format')),
      );
    } else {
      login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Image.asset("resources/images/img_logo.png"),
              const SizedBox(height: 10),
              const Text(
                "Welcome",
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
                    controller: useremail,
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
                    controller: password,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _validateAndLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .indigo, // Changed from primary to backgroundColor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 2, 60),
                      shadowColor: Colors.indigo.withOpacity(0.2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
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
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .white, // Changed from primary to backgroundColor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                        side:
                            const BorderSide(color: Colors.indigo, width: 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 3, 60),
                      shadowColor: Colors.indigo.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
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
