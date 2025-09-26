import 'package:flutter/material.dart';

class PledgeDialog extends StatefulWidget {
  final Function(int) onSubmit;

  const PledgeDialog({required this.onSubmit});

  @override
  _PledgeDialogState createState() => _PledgeDialogState();
}

class _PledgeDialogState extends State<PledgeDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[800], // Matches card blue
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      title: Text(
        "Enter Amount",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter amount to pledge",
          hintStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.blue[700],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: Text("CANCEL"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), // Pill-shaped like pledge button
            backgroundColor: Colors.white,
          ),
          child: Text("SUBMIT", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            var value = int.tryParse(_controller.text);
            if (value != null && value > 0) widget.onSubmit(value);
          },
        ),
      ],
    );
  }
}
