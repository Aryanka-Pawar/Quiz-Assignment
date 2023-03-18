import 'package:flutter/material.dart';
import 'dart:ui';

double height(context) {
  var myHeight = MediaQuery.of(context).size.height;
  return myHeight;
}

double width(context) {
  var myWidth = MediaQuery.of(context).size.width;
  return myWidth;
}

final myBlack = Color(0xff263d54);

Map<QuestionStatus, Color> questionsStatusColors = {
  QuestionStatus.attempted: Colors.green,
  QuestionStatus.answered_but_marked_for_review: Colors.yellow,
  QuestionStatus.unanswered_and_marked_for_review: Colors.orange,
  QuestionStatus.not_attempted: Colors.grey,
  QuestionStatus.does_not_want_to_attempt: Colors.pink,
};

enum Option{a, b, c, d, none}

enum QuestionStatus{
  attempted,
  answered_but_marked_for_review,
  unanswered_and_marked_for_review,
  not_attempted,
  does_not_want_to_attempt
}


Future<bool> askDialog(context, String message) async{
  return (await showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        title: Text(
          message,
          style: TextStyle(
              fontSize: 15.0
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            shape: StadiumBorder(),
            elevation: 1.0,
            color: Colors.white,
            child: Text(
              "Yes",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12
              ),
            ),
            splashColor: Colors.blue[100],
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context,true);
            },
          ),
          MaterialButton(
            shape: StadiumBorder(),
            elevation: 3.0,
            color: Colors.white,
            child: Text(
              "No",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12
              ),
            ),
            splashColor: Colors.blue[100],
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context,false);  //if its true then it will exit
            },
          ),
        ],
      )
  ))??false;
}

const textStyleForUserName = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 13,
    fontFamily: 'kufam',
    color: Colors.black
);

const textStyleForPageHeading = TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'DM Sans'
);

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: InputBorder.none,
  hintStyle: TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  ),
);


void showMessage(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

Widget customButton(String buttonName, Function function, double width){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 2.0),
    child: MaterialButton(
        color: Colors.blueAccent,
        elevation: 0.0,
        highlightElevation: 0.0,
        highlightColor: const Color.fromRGBO(143, 148, 251, 1),
        height: 50.0,
        minWidth: width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: () async{
          await function();
        },
        child:  Text(
          buttonName,
          style: const TextStyle(color: Colors.white),
        )
    ),
  );
}