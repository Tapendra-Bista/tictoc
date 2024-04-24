

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic/colors/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:primary));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> matcharray = [];
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  bool oturn = true;
  bool mybool = false;
  int filledbox = 0;
  bool game = false;
  void tapped(int index) {
    setState(() {
      if (oturn && displayxo[index] == '') {
        displayxo[index] = '0';
        filledbox++;
        mybool = false;
      } else if (!oturn && displayxo[index] == '') {
        displayxo[index] = 'X';
        mybool = true;
        filledbox++;
      }
      oturn = !oturn;
      winer();
    });
  }

  bool mybt = false;
  String result = "";
  void winer() {
    // 1 row
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      setState(() {
        result = "Player ${displayxo[0]} Wins!";
        updatescore(displayxo[0]);
        matcharray.addAll([0, 1, 2]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 2 row
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      setState(() {
        result = "Player ${displayxo[3]} Wins!";
        updatescore(displayxo[3]);
        matcharray.addAll([3, 4, 5]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 3 row
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      setState(() {
        result = "Player ${displayxo[6]} Wins!";
        updatescore(displayxo[6]);
        matcharray.addAll([6, 7, 8]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 1 col
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      setState(() {
        result = "Player ${displayxo[0]} Wins!";
        updatescore(displayxo[0]);
        matcharray.addAll([0, 3, 6]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 2 col
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      setState(() {
        result = "Player ${displayxo[1]} Wins!";
        updatescore(displayxo[1]);
        matcharray.addAll([1, 4, 7]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 3 col
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      setState(() {
        result = "Player ${displayxo[2]} Wins!";
        updatescore(displayxo[2]);
        matcharray.addAll([2, 5, 8]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 1 cross
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      setState(() {
        result = "Player ${displayxo[2]} Wins!";
        updatescore(displayxo[2]);
        matcharray.addAll([2, 4, 6]);
        button = true;
        game = false;
        mybt = true;
      });
    } else
    // 2 cross
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      setState(() {
        result = "Player ${displayxo[0]} Wins!";
        updatescore(displayxo[0]);
        matcharray.addAll([0, 4, 8]);
        button = true;
        game = false;
        mybt = true;
      });
    } else {
      if (filledbox == 9) {
        setState(() {
          result = "No Body Wins!";
          button = true;
          game = false;
          mybt = true;
        });
      }
    }
  }

  bool button = true;
  int ocscore = 0;
  int xcscore = 0;
  void updatescore(String mywinner) {
    if (mywinner == '0') {
      ocscore++;
    } else if (mywinner == 'X') {
      xcscore++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic_Toe',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primary,
        body: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Player 0",
                      style: GoogleFonts.coiny(
                          color: Colors.white, fontSize: 28, letterSpacing: 2),
                      children: [
                        TextSpan(
                          text: "\n\n\t\t\t\t\t\t\t$ocscore",
                          style: GoogleFonts.coiny(
                              color: Colors.white, fontSize: 23),
                        )
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "Player X",
                      style: GoogleFonts.coiny(
                          color: Colors.white, fontSize: 28, letterSpacing: 2),
                      children: [
                        TextSpan(
                          text: "\n\n\t\t\t\t\t\t\t$xcscore",
                          style: GoogleFonts.coiny(
                              color: Colors.white, fontSize: 23),
                        )
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            game ? tapped(index) : null;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: matcharray.contains(index)
                                    ? accentcolor
                                    : secondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  displayxo[index],
                                  style: GoogleFonts.coiny(
                                      color: mybool ? primary : Colors.white,
                                      fontSize: 50),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: GoogleFonts.coiny(
                            color: Colors.white, fontSize: 45),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondary,
                              fixedSize: const Size(150, 45),
                            ),
                            onPressed: () {
                              setState(() {
                                for (int i = 0; i < 9; i++) {
                                  displayxo[i] = '';
                                }
                                filledbox = 0;
                                result = '';
                                matcharray.clear();
                                game = true;
                                button = false;
                              });
                            },
                            child: Center(
                              child: Text(
                                mybt ? "Play Again!" : "Start",
                                style: GoogleFonts.coiny(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
