import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/my_constants.dart';

class NetworkDialog extends StatelessWidget {
  Function onTap;

  NetworkDialog({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(MyConstants.checkText1),
      content: Text(MyConstants.checkText2),
      actions: [
        TextButton(
            onPressed: () {
              onTap();
              Navigator.of(context).pop();
            },
            child: const Text('Ok')),
      ],
    );
  }
}
