import 'package:filmora/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == 2;
                });
              },
              controller: _controller,
              children: const [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/explore_films.png'),
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 48),
                    Text(
                      'Explore the World of Cinema',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Handjet'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/awaiting_films.png'),
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 48),
                    Text(
                      'Your Next Favorite Movie Awaits',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Handjet'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/journey_start.png'),
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 48),
                    Text(
                      'Your Movie Journey Starts Here',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Handjet'),
                    )
                  ],
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 1),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    dotColor: Colors.white,
                    activeDotColor: Colors.blueAccent),
              ),
            ),
            Visibility(
              visible: !onLastPage,
              child: GestureDetector(
                onTap: () {
                  goToHomePage(context);
                },
                child: Container(
                  alignment: const Alignment(-1, 1),
                  margin: const EdgeInsets.only(left: 24),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Handjet',
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            onLastPage
                ? GestureDetector(
                    onTap: () {
                      goToHomePage(context);
                    },
                    child: Container(
                      alignment: const Alignment(1, 1),
                      margin: const EdgeInsets.only(right: 24),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Handjet',
                            fontSize: 18),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      //do next
                      _controller.nextPage(
                          duration: const Duration(microseconds: 800),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      alignment: const Alignment(1, 1),
                      margin: const EdgeInsets.only(right: 24),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Handjet',
                            fontSize: 18),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void goToHomePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }
}
