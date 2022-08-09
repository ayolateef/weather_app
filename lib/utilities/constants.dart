import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'League Spartan',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'League Spartan',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'League Spartan',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    icon: Icon(Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0),
        ),
        borderSide: BorderSide.none
    )
);