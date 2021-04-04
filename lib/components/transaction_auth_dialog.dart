import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String) onConfirm;

  const TransactionAuthDialog({@required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        maxLength: 4,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: TextStyle(letterSpacing: 32, fontSize: 56),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: Text('Confirm'),
        )
      ],
    );
  }
}
