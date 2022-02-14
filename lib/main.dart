import 'package:bloc_test/second_view.dart';
import 'package:bloc_test/text_bloc.dart';
import 'package:bloc_test/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gloria – The World\'s Football Community',
        home: Builder(builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Image.asset(
                    'assets/background.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 96),
                      child: Column(
                        children: [
                          const SizedBox(height: 48),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/gloria_icon.png',
                                width: 80,
                              ),
                              const Text(
                                'Work at Gloria',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 96),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'The new platform for all football lovers. Now in beta on iOS.',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 32),
                                    ),
                                    const SizedBox(height: 40),
                                    const Text(
                                      'Chat about your favorite players and teams. Watch awesome videos. Show your skills and share your passion for the game. All in one place.',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: 30,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      child: const Text(
                                          'Get access via TestFlight'),
                                      onPressed: () => print('pressed'),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(flex: 1, child: Container()),
                              Flexible(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: (size.width * 0.025)),
                                  child: Image.asset(
                                    'assets/hero_image.png',
                                    fit: BoxFit.contain,
                                    height: size.height * 1.2,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AppStateBloc>(
//           create: (_) => AppStateBloc(),
//         ),
//         BlocProvider<ThemeBloc>(
//           create: (_) => ThemeBloc(),
//         ),
//       ],
//       child: BlocBuilder<ThemeBloc, AppTheme>(
//         builder: (context, theme) => MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             scaffoldBackgroundColor: theme.scaffoldColor,
//             primarySwatch: Colors.blue,
//           ),
//           home: const MyHomePage(),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Widget1(),
            Widget2(),
            Widget3(),
            Widget4(),
            Widget5(),
          ],
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 1 rebuild');
    return BlocBuilder<AppStateBloc, AppState>(builder: (context, state) {
      return Text(state.language);
    });
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 2 rebuild');
    return const Text('Widget 2');
  }
}

class Widget3 extends StatelessWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 3 rebuild');
    return ElevatedButton(
      child: const Text('Change Lang'),
      onPressed: () {
        context.read<AppStateBloc>().add(ChangeLanguagePressed());
      },
    );
  }
}

class Widget4 extends StatelessWidget {
  const Widget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 4 rebuild');
    return ElevatedButton(
      child: const Text('Change Theme'),
      onPressed: () {
        context.read<ThemeBloc>().add(ChangeScaffoldColor());
      },
    );
  }
}

class Widget5 extends StatelessWidget {
  const Widget5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 5 rebuild');
    return ElevatedButton(
      child: const Text('Second View'),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondView()));
      },
    );
  }
}
