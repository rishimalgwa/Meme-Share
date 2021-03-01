import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title, value;

  const TextWidget({
    @required this.title,
    @required this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 4.0, 10.0, 4),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
