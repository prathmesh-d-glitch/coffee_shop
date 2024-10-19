import 'dart:ui'; // Import for BackdropFilter
import 'package:coffee/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  // Email controller
  bool _isLogin = true;
  // To toggle between login and signup mode
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn) {
    String? storedUsername = prefs.getString('username');
    if (storedUsername != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomTabBar(user: storedUsername)),
      );
      print('User is already logged in: $storedUsername');
    }
  }
}

Future<void> _login() async {
  // Handle login logic, check username/password
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  await prefs.setString('username', _usernameController.text);  // Store username
  print('User logged in: ${_usernameController.text}');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CustomTabBar(user: _usernameController.text)),
  );
}

Future<void> _signup() async {
  // Handle signup logic, check email/username/password
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  await prefs.setString('username', _usernameController.text);  // Store username
  print('User signed up: ${_usernameController.text}');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CustomTabBar(user: _usernameController.text)),
  );
}

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background with coffee beans
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/beans.jpeg'), // Background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent, // Semi-transparent brown at the top
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.brown.withOpacity(0.3),
                      Colors.brown.withOpacity(
                          0.5), // Fully transparent at the bottom // Fully transparent at the bottom
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),

          // Position the container
          Positioned(
            left: screenWidth *
                0.08, // Adjust left based on screen width (similar to 32px)
            top: screenHeight * 0.1,
            bottom: _isLogin
                ? screenHeight * 0.08
                : screenHeight *
                    0.03, // Adjust top based on screen height (similar to 71px)
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(17)),
              child: SingleChildScrollView(
                // Wrap in SingleChildScrollView
                child: Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.9,
                  color: Colors.black.withOpacity(0.2),
                  // Blur effect
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 6.5, // Set horizontal blur radius to 6.5
                      sigmaY: 6.5, // Set vertical blur radius to 6.5
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFFFFFFF)
                                .withOpacity(0.23), // rgba(255, 255, 255, 0.23)
                            const Color(0xFFFFFFFF)
                                .withOpacity(0.12), // rgba(255, 255, 255, 0.12)
                            const Color(0xFFFFFFFF)
                                .withOpacity(0.11), // rgba(255, 255, 255, 0.11)
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white, // Add a solid border color
                          width: 1.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(17)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 24,
                            spreadRadius: -1,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo and title
                          Column(
                            children: [
                              Image.asset(
                                'assets/leaf.png', // Ensure this image is in your assets folder
                                width: 80,
                                height: 80,
                                color: Colors
                                    .white, // Optional: apply color filter
                              ),
                              const SizedBox(height: 10),
                              // Display "Swift" and "Café" on different lines
                              Text(
                                "Swift",
                                style: GoogleFonts.raleway(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w400,
                                  height:
                                      75.14 / 64, // Set line-height as required
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Café",
                                style: GoogleFonts.raleway(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  height:
                                      46.96 / 40, // Set line-height as required
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '"Latte but never late"',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.6),
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 20.0,
                                      color: Colors.white,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Username field
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _usernameController,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14, // Font size
                                    fontWeight: FontWeight.w400, // Font weight
                                  ),
                                  textAlign:
                                      TextAlign.center, // Center text alignment
                                  decoration: InputDecoration(
                                    labelText: 'User Name',
                                    labelStyle: GoogleFonts.inter(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.9),
                                        width: 1.8,
                                      ),
                                    ),
                                  ),
                                ),
                                if (!_isLogin) const SizedBox(height: 20),
                                if (!_isLogin)
                                  TextField(
                                    controller: _emailController,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14, // Font size
                                      fontWeight:
                                          FontWeight.w400, // Font weight
                                    ),
                                    textAlign: TextAlign
                                        .center, // Center text alignment
                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      labelStyle: GoogleFonts.inter(
                                        color: Colors.white,
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.9),
                                          width: 1.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: true, // Hides the text input
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14, // Font size
                                    fontWeight: FontWeight.w400, // Font weight
                                  ),
                                  textAlign:
                                      TextAlign.center, // Center text alignment
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: GoogleFonts.inter(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.9),
                                        width: 1.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Login Button
                          Container(
                            width: 245,
                            height: 49,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF4D2B1A),
                                  Color(0xFFA7745A),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.65),
                                  offset: const Offset(2, 2),
                                  blurRadius: 15,
                                  spreadRadius: -2,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _isLogin ? _login() : _signup();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                _isLogin ? 'Login' : 'Signup',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 24.2 / 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Signup Button
                          Container(
                            width: 245,
                            height: 49,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  !_isLogin ? 'Login' : 'Signup',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Footer text
                          GestureDetector(
                            onTap: () {
                              // Add privacy policy action
                            },
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
