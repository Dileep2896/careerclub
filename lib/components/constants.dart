import 'package:flutter/material.dart';

const primaryColor = Color(0xff00c2cb);
const secondaryColor = Color(0xffc3edef);
const darkColor = Color(0xff293039);

const kSendButtonTextStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.blue),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
  ),
);

var kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  prefixIcon: const Icon(Icons.email),
  labelText: 'Enter a Value',
  contentPadding: const EdgeInsets.symmetric(
    vertical: 8.0,
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade400,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
