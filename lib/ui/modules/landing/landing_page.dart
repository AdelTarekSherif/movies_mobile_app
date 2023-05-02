import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_mobile_app/ui/common/custom_button.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/ui/style/theme.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: Center(
              child: SvgPicture.asset('assets/images/poster.svg'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Millions of movies,\nTV shows and people\nto discover. Explore now.',
                    style: AppTheme.landingTextStyle(context),
                  ),
                  const Spacer(),
                  CustomButton(
                    cornerRadius: 50,
                    isLoading: false,
                    label: 'Get Started',
                    
                    style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),
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
