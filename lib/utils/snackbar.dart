import 'package:flutter/material.dart';

class SnackBarW extends StatefulWidget {
  const SnackBarW({super.key});

  @override
  State<SnackBarW> createState() => _SnackBarWState();
}

theSnackBar(context, String message) {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 260.0,
          child: Text(
            message,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        Icon(Icons.error),
      ],
    ),
    backgroundColor: Colors.orangeAccent,
  );
}
class _SnackBarWState extends State<SnackBarW> {
  @override
  Widget build(BuildContext context) {
    return theSnackBar(context, "message");

    }
}
