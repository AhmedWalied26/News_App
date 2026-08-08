import 'package:flutter/material.dart';

class MainWaiting extends StatelessWidget {
  const MainWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).splashColor),
    );
  }
}
