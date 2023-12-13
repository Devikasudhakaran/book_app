import 'package:flutter/material.dart';
import 'listview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Hardcoded username and password
  final String _hardcodedUsername = "Admin";
  final String _hardcodedPassword = "123";


  bool get isLoginButtonEnabled =>
      _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900] ?? Colors.orange,
              Colors.orange[800] ?? Colors.orange,
              Colors.orange[400] ?? Colors.orange,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100,),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login", style: TextStyle(color: Colors.white,fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Welcome Back", style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(height: 60,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200] ?? Colors.grey)),
                              ),
                              child: TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200] ?? Colors.grey)),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                      const Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                      const SizedBox(height: 40,),

                      ElevatedButton(
                        onPressed: isLoginButtonEnabled
                            ? () {
                  // Check if the entered credentials match the hardcoded values
                  if (_usernameController.text == _hardcodedUsername &&
                  _passwordController.text == _hardcodedPassword) {
          // Navigate to the Home screen if the credentials are correct
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        }else {
                    // Show an error message or handle incorrect credentials
                    // For simplicity, you can show a SnackBar with an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid username or password"),
                      ),
                    );
                  }
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
