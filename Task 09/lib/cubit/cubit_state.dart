import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasbeeh {
  final int count;
  final int idx;

  Tasbeeh({required this.count, required this.idx});
}

class Sub7a extends Cubit<Tasbeeh> {
  Sub7a() : super(Tasbeeh(count: 0, idx: 0));

  final List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];

  void increment() {
    if (state.count < 33) {
      emit(Tasbeeh(count: state.count + 1, idx: state.idx));
    } else {
      emit(Tasbeeh(count: 0, idx: (state.idx + 1) % azkar.length));
    }
  }

  void reset() {
    emit(Tasbeeh(count: 0, idx: 0));
  }
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Sub7a(),
      child: BlocBuilder<Sub7a, Tasbeeh>(
        builder: (context, state) {
          final cubit = context.read<Sub7a>();

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 77, 159, 194),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 227, 163, 43),
              elevation: 0,
              centerTitle: true,
              title: const Text("Sub7a"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      cubit.azkar[state.idx],
                      key: ValueKey(state.idx),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2C5364), Color(0xFF203A43)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        state.count.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  GestureDetector(
                    onTap: cubit.increment,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.tealAccent,
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.tealAccent.withOpacity(.5),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.touch_app,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: cubit.reset,
                    child: const Text(
                      "Refresh",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
