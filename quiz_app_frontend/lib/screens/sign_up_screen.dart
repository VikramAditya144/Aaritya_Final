import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E1E), // Dark grey
              Color(0xFF2D2D2D)  // Slightly lighter grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Join Us!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Create your account to start trading",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.15),
                  filled: true,
                  labelText: 'Phone number',
                  labelStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.15),
                  filled: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.15),
                  filled: true,
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Color(0xFF3F51B5), // Blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(
                  "Already have an account? Sign In",
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
