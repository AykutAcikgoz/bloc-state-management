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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppStateBloc>(
          create: (_) => AppStateBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, AppTheme>(
        builder: (context, theme) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: theme.scaffoldColor,
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

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
