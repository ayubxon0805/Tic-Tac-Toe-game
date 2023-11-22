import 'package:flutter/material.dart';
import 'package:flutter_application_2/prsentation/resources/colors.dart';
import 'package:flutter_application_2/prsentation/widgets/w_button.dart';
import 'package:flutter_application_2/screen/game/game_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.gradientStart,
          AppColors.gradientEnd,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            const Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 210),
                    Text(
                      "Tic-Tac-Toe",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Pick who goes first?',
                  style: TextStyle(fontSize: 24, color: AppColors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WButton(
                        icon: 'assets/xharfi.png',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const GameScreen(
                                currentPlayer: 'x',
                              );
                            },
                          ));
                        }),
                    const SizedBox(width: 25),
                    WButton(
                        icon: 'assets/dumaloq.png',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const GameScreen(
                                currentPlayer: 'o',
                              );
                            },
                          ));
                        })
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
