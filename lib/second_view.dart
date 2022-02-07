import 'package:bloc_test/text_bloc.dart';
import 'package:bloc_test/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SecondViewWidget(),
            const Widget4(),
          ],
        ),
      ),
    );
  }
}

class SecondViewWidget extends StatelessWidget {
  const SecondViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Second View Widget rebuild');
    return BlocBuilder<AppStateBloc, AppState>(
      builder: (context, state) => Text(state.language),
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
