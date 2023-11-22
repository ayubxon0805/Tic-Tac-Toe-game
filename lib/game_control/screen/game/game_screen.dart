import 'package:flutter/material.dart';
import 'package:flutter_application_2/prsentation/resources/colors.dart';
import 'package:flutter_application_2/screen/into/intro_screen.dart';

class GameScreen extends StatefulWidget {
  final String currentPlayer;
  const GameScreen({super.key, required this.currentPlayer});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _board = [];

  String winner = "";

  String _currentPlayer = "";

  @override
  void initState() {
    _board = List.filled(9, '');
    _currentPlayer = widget.currentPlayer;
    super.initState();
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'x' ? '0' : 'x';
  }

  void checkWinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var line in lines) {
      var a = _board[line[0]];
      var b = _board[line[1]];
      var c = _board[line[2]];

      if (a == b && b == c && a != '') {
        winner = a;
        break;
      }
    }
    if (winner == '' && !_board.contains('')) {
      winner = 'Friendship 🤝';
    }
  }

  void _playMove(int index) {
    if (_board[index] == '' && winner == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _switchPlayer();
        checkWinner();
      });
    }
  }

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
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              winner == ""
                  ? " $_currentPlayer player's turn"
                  : 'Winner: $winner',
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            Container(
              width: 324,
              height: 324,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: AppColors.shadow, blurRadius: 15)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) => GestureDetector(
                      onTap: () => _playMove(index),
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: _board[index] != ""
                            ? Center(
                                child: Image.asset(
                                  _board[index] == '0'
                                      ? 'assets/dumaloq.png'
                                      : 'assets/xharfi.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )
                            : const SizedBox(),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.shadow, width: 2)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (winner != "") ...{
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const IntroScreen(),
                      ),
                      (route) => false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.yellow),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
