import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text(
              'Counter Functions Screen',
            )),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                },
              ),
            ]),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$clickCounter',
                  style: const TextStyle(
                      fontSize: 150, fontWeight: FontWeight.w200),
                ),
                Text(
                  clickCounter == 1 ? 'Click' : 'Clicks',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )
              ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                if (clickCounter >= 0) {
                  setState(() {
                    clickCounter++;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                if (clickCounter > 0) {
                  setState(() {
                    clickCounter--;
                  });
                }
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
