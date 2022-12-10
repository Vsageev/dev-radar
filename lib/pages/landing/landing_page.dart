import 'package:dev_radar/pages/new_community/new_community_page.dart';
import 'package:dev_radar/shared/colors.dart';
import 'package:dev_radar/shared/custom_type_text.dart';
import 'package:dev_radar/shared/widgets/background_balls.dart';
import 'package:dev_radar/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBalls(),
          Center(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Analize developer',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'communities ',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AnimatedTextKit(
                                animatedTexts: [
                                  CustomTypewriterAnimatedText(
                                    'fast',
                                    cursor: '|',
                                    textStyle: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.accent,
                                    ),
                                    speed: const Duration(milliseconds: 150),
                                  ),
                                  CustomTypewriterAnimatedText(
                                    'efficiently',
                                    cursor: '|',
                                    textStyle: const TextStyle(
                                        fontSize: 30.0, fontWeight: FontWeight.bold, color: CustomColors.accent),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                  CustomTypewriterAnimatedText(
                                    'with DevRadar',
                                    cursor: '|',
                                    textStyle: const TextStyle(
                                        fontSize: 30.0, fontWeight: FontWeight.bold, color: CustomColors.accent),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                repeatForever: true,
                                pause: const Duration(milliseconds: 1000),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        color: Colors.transparent,
                        border: Border.all(color: CustomColors.accent, width: 3),
                        child: const Text(
                          'Add new community',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.accent,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewCommunityPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
