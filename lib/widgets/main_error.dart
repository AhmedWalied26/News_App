import 'package:flutter/material.dart';

class MainError extends StatelessWidget {
  final VoidCallback onTap;
  const MainError({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          ElevatedButton(
            onPressed: onTap,
            child: Text(
              'Try again',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
