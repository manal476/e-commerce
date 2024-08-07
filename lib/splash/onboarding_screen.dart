import 'package:e_commerce/splash/onbprding.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/login/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            image: 'lib/img/img2.png',
            title: 'Free-Spirited Fashion Finds',
            description:
                'Browse thousands of products, from fashion to tech. Find what you love, effortlessly.',
            onNext: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onLogin: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            currentPage: _currentPage,
            pageIndex: 0,
          ),
          OnboardingPage(
            image: 'lib/img/img3.png',
            title: 'Dressing Well Made Easy',
            description:
                'Discover a collection that speaks volumes in silence.',
            onNext: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onLogin: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            currentPage: _currentPage,
            pageIndex: 1,
          ),
          OnboardingPage(
            image: 'lib/img/img4.png',
            title: 'Elegance Redefined',
            description:
                'Discover a world of timeless fashion for the modern woman.',
            onNext: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            onLogin: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            currentPage: _currentPage,
            pageIndex: 2,
          ),
        ],
      ),
    );
  }
}
