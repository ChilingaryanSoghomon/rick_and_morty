
import 'package:flutter/material.dart';

class CharacterLInitialWidget extends StatelessWidget {
  final String text;
  const CharacterLInitialWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 15,
          ),
          
          const CircularProgressIndicator(
            color: Colors.grey,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}


