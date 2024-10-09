import 'package:flutter/material.dart';
import 'package:flutter_application_2/game_control/prsentation/resources/colors.dart';

class ClassicGameScreen extends StatefulWidget {
  final String currentPlayer;
  const ClassicGameScreen({super.key, required this.currentPlayer});

  @override
  State<ClassicGameScreen> createState() => _ClassicGameScreen();
}

class _ClassicGameScreen extends State<ClassicGameScreen> {
  List<String> _board = [];
  List<int> xPositions = [];
  List<int> oPositions = [];
  int bot = 0;
  int user = 0;

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
        setState(() {
          winner = a;
          if (winner == 'x') {
            user++;
          } else if (winner == '0') {
            bot++;
          }
        });
        break;
      }
    }
    // if (winner == '' && !_board.contains('')) {
    //   winner = 'Friendship 🤝';
    // }
  }

  void _playMove(int index) {
    if (_board[index] == '' && winner == '') {
      setState(() {
        if (_currentPlayer == 'x') {
          if (xPositions.length >= 3) {
            int oldXPosition = xPositions.removeAt(0);
            _board[oldXPosition] = '';
          }
          xPositions.add(index);
        } else {
          if (oPositions.length >= 3) {
            int oldOPosition = oPositions.removeAt(0);
            _board[oldOPosition] = '';
          }
          oPositions.add(index);
        }

        _board[index] = _currentPlayer;
        _switchPlayer();
        checkWinner();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Classic Mode',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _board = List.filled(9, '');
                    xPositions.clear();
                    oPositions.clear();
                    winner = "";
                    _currentPlayer = widget.currentPlayer;
                  });
                },
                child: const Text(
                  'Restart Game',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ))
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.dark,
            AppColors.dark,
            Color.fromARGB(255, 59, 69, 82),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/xharfi.png',
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      'You:$user',
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: Text(
                    winner == ""
                        ? " ${_currentPlayer == 'x' ? '      X turn' : "      O turn"}"
                        : ' ${winner == 'x' ? "     X Won!" : "      O Won!"}',
                    style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/dumaloq.png',
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      'Friend:$bot',
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 100),
            Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 234, 9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const []),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(7),
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) => GestureDetector(
                      onTap: () => _playMove(index),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: _board[index] != ""
                              ? Center(
                                  child: Image.asset(
                                    _board[index] == '0'
                                        ? 'assets/dumaloq.png'
                                        : 'assets/xharfi.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              : const SizedBox(),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.shadow, width: 2)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
