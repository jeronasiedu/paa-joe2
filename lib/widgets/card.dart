import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.2),
      ),
      // WITHIN CONTAINER, IS A COLUMN
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // WITHIN COLUMN IS A ROW
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Text('1'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Take/Select a photo of an affected plant by tapping the camera or gallery button below",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          // END OF A ROW
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Text('2'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Give it a shot before you can get a suggestion of that disease",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
