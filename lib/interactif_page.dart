import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget {

  @override
  InteractifPageState createState() => InteractifPageState();

}

class InteractifPageState extends State<InteractifPage> {

  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Tout ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Tout ce que l'on va faire pendant que le widget sera dispose. Quand le widget sera supprimé
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
            "Les interactifs",
          style: TextStyle(
            color: Colors.white
        ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Text("Apprendre les interactifs", style: TextStyle(color: textColor),),),
      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,
        child: const Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white) ? Colors.black: Colors.white;
      textColor = (textColor == Colors.black) ? Colors.white: Colors.black;
    });
  }

}