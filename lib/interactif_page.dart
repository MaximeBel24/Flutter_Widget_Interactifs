import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget {

  @override
  InteractifPageState createState() => InteractifPageState();

}

class InteractifPageState extends State<InteractifPage> {

  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool textButtonPressed = true;
  Color elevatedColorBackgroundBottom = Colors.redAccent;
  IconData icon = Icons.favorite;

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
        title: Text(
            updateAppBarText(),
          style: const TextStyle(
            color: Colors.white
        ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Column(
        children: [
          TextButton(
              onPressed: updateAppBar,
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange
            ),
              child: Row(
                children: [
                  const Icon(Icons.work),
                  textButtonText()
                ],
              ),
          ),
          ElevatedButton(
              onPressed: updateColorsOnSimplePress,
            onLongPress: updateColorsOnLongPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: elevatedColorBackgroundBottom,
              elevation: 5,
              shadowColor: Colors.cyanAccent
            ),
            child: const Text(
              "Elevated Button",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),
          IconButton(
            onPressed: updateElevatedButtonColor,
            icon: Icon(icon),
            color: Colors.pink,
            splashColor: Colors.pinkAccent,
          ),
          IconButton(
            onPressed: setIcon,
            icon: const Icon(Icons.edit_outlined),
            color: Colors.blue,
            splashColor: Colors.blueAccent,
          )
        ],
      ),),
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

  updateColorsOnLongPress() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white ||backgroundColor == Colors.black) ? Colors.deepOrange: Colors.white;
    });
  }

  updateColorsOnSimplePress() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white ||backgroundColor == Colors.black) ? Colors.deepOrange: Colors.black;
    });
  }

  updateElevatedButtonColor() {
    setState(() {
      elevatedColorBackgroundBottom = (elevatedColorBackgroundBottom == Colors.redAccent) ? Colors.green: Colors.redAccent;
    });
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  String updateAppBarText() {
    return(textButtonPressed)? "Je m'y connais un peu" : "Les interactifs";
  }

  Text textButtonText() {
    return const Text(
      "Je suis un texte button",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  setIcon() {
    setState(() {
      icon = (icon == Icons.favorite) ? Icons.heart_broken_rounded: Icons.favorite;
    });
  }

}