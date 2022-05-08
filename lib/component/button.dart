
import 'package:flutter/material.dart';

/*
 * Component of button defauld, to be used throughout the app
 * @author  SVM - 20220413 
 * @version 1.0 - 20220413 - initial release
 * @param   <onPressed> Function to define action of button  
 * @param   <customCollor> define color 
 * @param   <child> It has to be defined in some child, in order for it to work 
 *                   perfectly example: Container(child:careConnectButton())
 * @param   <bigButton> Defines the size of the button 
 *                      true => size of the entire screen, 
 *                      false => size of the text of the same
 * @return  <component> ElevatedButton
 */


ElevatedButton buttonComponent (BuildContext context, { required void Function() onPressed, required Widget child, Color? customCollor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom( primary: customCollor, textStyle: const TextStyle(fontSize: 20),  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
    ),
    onPressed: onPressed,
    child: Container(
      padding:const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: child,
    ),
  );
}
