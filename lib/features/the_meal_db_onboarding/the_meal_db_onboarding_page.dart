import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_connector.dart';
import 'package:flutter/material.dart';

class TheMealDBApiOnboardingPage extends StatelessWidget {
  const TheMealDBApiOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onBoardingSource),
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    welcomeRecipeAppLabel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Wrap(
                  runSpacing: 20.0,
                  children: [
                    Text(
                      triviaText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: white),
                    ),
                    Text(
                      triviaTextAnswer,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    ElevatedButton(
                      style: Button.fluidButton(),
                      onPressed: () => _navigateToOverviewPage(context),
                      child: Text(
                        getStartedLabel,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
