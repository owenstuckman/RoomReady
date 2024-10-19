
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'themes.dart';


//Getting amazon image src: window.addEventListener('click', function (e) {navigator.clipboard.writeText(document.getElementById("landingImage").src)});

class GlobalWidgets {
  static Widget sparklii(BuildContext context, {double blur = 0}){
    return Text(
      "Sparklii",
      style: TextStyle(
        shadows: [
          Shadow(
            blurRadius: blur,
            color: Theme.of(context).colorScheme.onPrimary
          )
        ],
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget iconCircle({required Color color,
    required IconData icon,
    double radius = 20.5,
    double padding = 5.5,
    void Function()? onPressed,
    Color iconColor = Colors.black}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(radius: radius, backgroundColor: color),
        GestureDetector(
            onTap: onPressed,
            child: Icon(
              icon,
              color: iconColor,
              size: radius * 2 - padding,
            )),
      ],
    );
  }


  static Widget checkBox(BuildContext context, bool value,
      {String text = '', void Function()? onPressed, double? size}) {
    return TextButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        child: Row(
          children: [
            SizedBox(width: 5),
            AbsorbPointer(
              child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                      value: value,
                      activeColor: Colors.white10,
                      checkColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                            (states) =>
                            BorderSide(width: 1.0, color: Colors.black87),
                      ),
                      onChanged: (bool? value) {})),
            ),
            SizedBox(
              width: size,
              height: 35,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style:
                  TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface,
                    fontFamily: 'Georama',),
                ),
              ),
            )
          ],
        ));
  }

  static Widget comingSoon(BuildContext context, String text, IconData icon) {
    return Container(
      color: Theme
          .of(context)
          .colorScheme
          .secondary,
      child: Center(
        child: Card(
            color: Theme
                .of(context)
                .colorScheme
                .surface,
            child: SizedBox(
              height: 250,
              width: 300,
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Icon(icon, color: Colors.black, size: 100),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Delius',
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  static Widget textBubble(BuildContext context,
      {String text = '',
        IconData? icon,
        Color? color,
        Color? textColor,
        Color? iconColor,
        Color? borderColor,
        EdgeInsets? spacing,
        double? width,
        double? height,
        double curve = 20,
        void Function()? onPressed}) {
    Widget buildBubble() {
      return SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            margin: spacing,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(curve),
                border: borderColor != null
                    ? Border.all(
                    color: borderColor,
                    width: 3.5,
                    strokeAlign: BorderSide.strokeAlignOutside)
                    : null,
                color: color ?? Theme
                    .of(context)
                    .colorScheme
                    .primary),
            child: Row(
              children: [
                SizedBox(width: 1),
                if (icon != null)
                  Icon(icon,
                      color:
                      iconColor ?? Theme
                          .of(context)
                          .colorScheme
                          .onPrimary),
                if (text.isNotEmpty)
                  Text(' $text ',
                      style: TextStyle(
                          fontSize: 20,
                          color: textColor ??
                              Theme
                                  .of(context)
                                  .colorScheme
                                  .onPrimary))
              ],
            ),
          ),
        ),
      );
    }

    if (onPressed != null) {
      return TextButton(
          onPressed: () {
            onPressed();
          },
          child: buildBubble());
    }
    return buildBubble();
  }


}
