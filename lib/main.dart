import 'package:animation_proof_of_concept/animation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AnimationCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animation'),
      ),
      body: BlocBuilder<AnimationCubit, int>(builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/jsons/TOM_$state.json',
                frameRate: FrameRate(30),
              ),
            ),
            Image.asset('assets/images/Week04.png'),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<AnimationCubit>().changeAnimation(),
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}
