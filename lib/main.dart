import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("data"),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          )),
        ));
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  //initState는 모든 상황에서 필요한게 아니다.
  void initState() {
    print("init");
    // TODO: implement initState
    super.initState();
  }

  //dispose method는 무언기를 취소하는 메소드
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    print("disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // 부모 요소인 textTheme을 접근하기 위한 과정
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
