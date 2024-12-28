import 'dart:ui';

class StyleConstants {
   static TextStyle heading(Color? color) {
    return TextStyle(
                    color: color,
                     fontSize: 25,
                      fontWeight: FontWeight.bold);
  }

  static TextStyle checkout(Color? color) {
    return TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle viewall =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  static  TextStyle productdescription =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  static  TextStyle productprice =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static  TextStyle details =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  static  TextStyle Size =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
}