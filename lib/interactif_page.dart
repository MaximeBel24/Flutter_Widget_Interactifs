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
  String prenom = "";
  late TextEditingController controller;
  bool switchValue = true;
  double sliderValue = 50;
  bool check = false;
  Map<String, bool> courses = {
    "Carottes": false,
    "Oignon": true,
    "Abricot": false
  };
  int groupValue = 1;
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime(2040);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Tout ce que l'on va faire pendant l'initialisation du widget
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
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
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: updateAppBar,
                style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                child: Row(
                  children: [const Icon(Icons.work), textButtonText()],
                ),
              ),
              firstElvButton(),
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
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "Entrez votre prénom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                keyboardType: TextInputType.emailAddress,
                onChanged: (newString) {
                  setState(() {
                    prenom = newString;
                  });
                },
              ),
              Text(prenom),
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: "Entrez votre nom"),
                onChanged: ((newValue) =>
                    setState(() => print("Done: $newValue"))),
              ),
              Text(controller.text),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((switchValue)
                      ? "J'aime Elden Ring"
                      : "Vivement le 21 juin"),
                  Switch(
                      value: switchValue,
                      activeColor: Colors.cyan,
                      inactiveTrackColor: Colors.white,
                      onChanged: ((bool) {
                        setState(() {
                          switchValue = bool;
                        });
                      }))
                ],
              ),
              Slider(
                activeColor: Colors.cyan,
                inactiveColor: Colors.cyanAccent,
                value: sliderValue,
                min: 0,
                max: 100,
                onChanged: ((newValue) {
                  setState(() {
                    sliderValue = newValue;
                  });
                }),
                thumbColor: Colors.blue,

              ),
              Text("Valeur: ${sliderValue.toInt()}"),
              Checkbox(value: check, onChanged: ((newBool) => setState(() => check = newBool ?? false))),
              checks(),
              radios(),
              secondElvButton(),
              checks()


            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,
        child: const Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white) ? Colors.black : Colors.white;
      textColor = (textColor == Colors.black) ? Colors.white : Colors.black;
    });
  }

  updateColorsOnLongPress() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white || backgroundColor == Colors.black)
              ? Colors.deepOrange
              : Colors.white;
    });
  }

  updateColorsOnSimplePress() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white || backgroundColor == Colors.black)
              ? Colors.deepOrange
              : Colors.black;
    });
  }

  updateElevatedButtonColor() {
    setState(() {
      elevatedColorBackgroundBottom =
          (elevatedColorBackgroundBottom == Colors.redAccent)
              ? Colors.green
              : Colors.redAccent;
    });
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  String updateAppBarText() {
    return (textButtonPressed) ? "Je m'y connais un peu" : "Les interactifs";
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
      icon = (icon == Icons.favorite)
          ? Icons.heart_broken_rounded
          : Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> items = [];
    courses.forEach((course, achete){
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(course),
          Checkbox(value: achete, onChanged: ((newValue){
            setState(() {
              courses[course] = newValue ?? false;
            });
          }),
          checkColor: Colors.white,
          activeColor: Colors.cyan,)
        ],
      );
      items.add(row);
    });
    return Column(children: items);
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio r = Radio(
          value: i,
          groupValue: groupValue,
          activeColor: Colors.cyan,
          onChanged: ((newValue){
            setState(() {
              groupValue = newValue as int;
            });
          }));
      radios.add(r);
    }
    return Row(children: radios,);
  }

  ElevatedButton firstElvButton(){
    return ElevatedButton(
      onPressed: updateColorsOnSimplePress,
      onLongPress: updateColorsOnLongPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: elevatedColorBackgroundBottom,
          elevation: 5,
          shadowColor: Colors.cyanAccent),
      child: const Text(
        "Elevated Button",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  ElevatedButton secondElvButton(){
    return ElevatedButton(
      onPressed: () {
        showDate(context);
      },
      onLongPress: updateColorsOnLongPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: elevatedColorBackgroundBottom,
          elevation: 5,
          shadowColor: Colors.cyanAccent),
      child: const Text(
        "Show Date Picker",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void showDate(BuildContext context){
    showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate
    ).then((value) => {
      if (value != null) {
        setState(() {
          firstDate = value;
        })
      }
    });
  }
}





