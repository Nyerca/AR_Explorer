import 'package:flutter/material.dart';


//Widget per mostrare la i
class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Mage bat that casts spells as fast as it eats animals" + "\n",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
