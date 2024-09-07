import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
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
                  activeDotColor: Colors.blueAccent
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
