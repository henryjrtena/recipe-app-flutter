import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_connector.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';

class TheMealDBApiOnboardingPage extends StatelessWidget {
  const TheMealDBApiOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/jpeg/onboarding.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(40.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: onboardingBlackGradient,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text(
                      'Welcome to the\r\n Recipe App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Did you know that Italian\r\n food is the most popular\r\n around the world?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    const VerticalSpacing(height: 20.0),
                    const Text(
                      'Italian pizza in particular is very\r\n popular and long ago crossed the\r\n borders of Italy. It is now consumed all\r\n over the world.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const VerticalSpacing(height: 20.0),
                    ElevatedButton(
                      style: Button.fluidButton(),
                      onPressed: () => _navigateToOverviewPage(context),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToOverviewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TheMealDBApiOverviewConnector()),
    );
  }
}
