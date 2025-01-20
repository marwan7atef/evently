import 'package:flutter/material.dart';

class DeafultTextbuttom extends StatelessWidget {
VoidCallback onpress;
String label;
DeafultTextbuttom({required this.label,required this.onpress});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpress, child: Text("$label")




    );
  }
}
