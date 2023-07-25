import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 100;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //지금 당장 property를 초기화 하지않아도 된다는 뜻
  //사용하기 전에 초기화 해야 한다.
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return (duration.toString().split(".")[0].substring(2, 7));
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
    //duration 마다 함수를 실행
  }

  // Widget next() {
  //   return const App();
  // }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
                child: Column(
              children: [
                IconButton(
                  iconSize: 100,
                  color: Theme.of(context).cardColor,
                  icon: Icon(isRunning
                      ? Icons.pause_circle
                      : Icons.play_circle_outline),
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                ),
              ],
            )),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            // color: Color.fromARGB(0, 0, 0, 0),
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            // color: Color.fromARGB(0, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
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

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xFF181818),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 80,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Hey, Selena",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 28,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Text("Welcome Back",
//                               style: TextStyle(
//                                 color: Color.fromRGBO(255, 255, 255, 0.8),
//                                 fontSize: 18,
//                               )),
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       color: Color.fromRGBO(255, 255, 255, 0.8),
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     '\$5 194 482',
//                     style: TextStyle(
//                       fontSize: 48,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Button(
//                         text: "transfer",
//                         bgColor: Color(0xFFF1B33B),
//                         textColor: Colors.black,
//                       ),
//                       Button(
//                         text: "request",
//                         bgColor: Color(0xFF1F2123),
//                         textColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Wallet',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 36,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           'View All',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.8),
//                             // color: Colors.white.withOpacity(0.8),
//                           ),
//                         ),
//                       ]),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const CurrencyCard(
//                     name: "Euro",
//                     code: "EUR",
//                     amount: "22222",
//                     icon: Icons.euro_rounded,
//                     isInverted: false,
//                     num: 0,
//                   ),
//                   const CurrencyCard(
//                     name: "Bitcoin",
//                     code: "btc",
//                     amount: "22222",
//                     icon: Icons.currency_bitcoin,
//                     isInverted: true,
//                     num: 1,
//                   ),
//                   const CurrencyCard(
//                     name: "Euro",
//                     code: "EUR",
//                     amount: "22222",
//                     icon: Icons.euro_rounded,
//                     isInverted: false,
//                     num: 2,
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
