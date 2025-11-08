import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:serialman/core/shared_widget/custom_background.dart';
import 'package:serialman/core/shared_widget/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:serialman/feature/auth_feature/view/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Color(0xFF1A4E8D), Color(0xFF48BFCE)],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //   ),
          // ),
          // CustomPaint(painter: WavePainter(), child: Container()),
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage1(),
              _buildPage2(),
              _buildPage3(),
              _buildPage4(),
            ],
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: _currentPage == 0
                ? SizedBox.shrink()
                : _currentPage == 3
                ? _buildGetStartedButton()
                : _buildIndicatorAndButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Stack(
      children: [
        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Color(0xFF1A4E8D), Color(0xFF48BFCE)],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
        // CustomPaint(painter: WavePainter(), child: Container()),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        CustomPaint(painter: WavePainter(), child: Container()),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/s.1.png"),
              SizedBox(height: 20),
              Text(
                "SerialMan",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Smart Queue, Better Care",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
             const SizedBox(height: 30),
              _buildGetStartedButton()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomPaint(painter: WavePainter(), child: Container()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const Text(
                  "Welcome \nto SerialMan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Lottie.asset(
                  'assets/animations/Medical Assistant.json',
                  height: 300,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Book appointments\n effortlessly and\n manage queues.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage3() {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomPaint(painter: WavePainter(), child: Container()),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const Text(
                  "Real-time Tracking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // const SizedBox(height: 40),
                SizedBox(
                  height: 350,
                  child: Image.asset(
                    "assets/image/images3rd.png",
                    fit: BoxFit.cover,
                  ),
                ),
                //const SizedBox(height: 30),
                const Text(
                  "See your place in line\n with live updates.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage4() {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomPaint(painter: WavePainter(), child: Container()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const Text(
                  "Stay Informed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                //const SizedBox(height: 40),
                Lottie.asset(
                  "assets/animations/Notification Bell.json",
                  height: 250,
                ),
                // const SizedBox(height: 30),
                const Text(
                  "Get instant alerts\n and reminders.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorAndButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.5)),
          ),
          child: Text(
            '${_currentPage}/3',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
         Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1A4E8D),
          foregroundColor: const Color(0xFF1A4E8D),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
