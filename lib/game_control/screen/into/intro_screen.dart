import 'package:flutter/material.dart';
import 'package:flutter_application_2/game_control/prsentation/resources/colors.dart';
import 'package:flutter_application_2/game_control/screen/game/classic_game_screen.dart';
import 'package:flutter_application_2/game_control/screen/game/game_screen.dart';

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
          AppColors.dark,
          AppColors.dark,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 150),
                    const Text(
                      "Tic Tac Toe",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    Image.asset('assets/tictac.png'),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(196, 53, 60, 89),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(400, 60)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const InfiniteGameScreen(
                                  currentPlayer: 'x');
                            },
                          ));
                        },
                        child: const Text(
                          'infinite game',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(196, 53, 60, 89),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(400, 60)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ClassicGameScreen(
                                  currentPlayer: 'x');
                            },
                          ));
                        },
                        child: const Text(
                          'classic game',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
