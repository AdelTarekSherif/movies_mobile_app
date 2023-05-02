import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_mobile_app/ui/common/custom_button.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/ui/style/theme.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          Image.asset(
            'assets/images/poster.png',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'Millions of movies,\n',
                      style: AppTheme.landingTextStyle(context),
                      children:  [
                        const TextSpan(
                        text: 'TV shows and people.\n',
                        ),
                        const TextSpan(
                          text: 'To discover.',
                        ),
                        TextSpan(
                          text: ' Explore now.',
                          style: TextStyle(
                            fontSize: 26,
                            color: AppColors.customGreyLevelSubtitle2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                    ),

                  ),
                  const Spacer(),
                  CustomButton(
                    cornerRadius: 50,
                    isLoading: false,
                    label: 'Get Started',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RouteNames.rHomeScreen),
                    buttonColor: AppColors.secondryColor,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
