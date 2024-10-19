import  'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Account Page/Settings/settings.dart';
import '../Explore Page/detail.dart';
import 'themes.dart';
import 'database_helpers.dart';

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
        color: (Themes.themeSettings[Settings.theme] ?? [])
            .contains('redSprklii')
            ? Color(0xffec6464)
            : (Themes.themeSettings[Settings.theme] ?? [])
            .contains('invertSparklii')
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary,
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

  static Widget urlImage(String url, {bool placeholder = true}) {
    if(!placeholder){
      return CachedNetworkImage(
        imageUrl: url,
        filterQuality: FilterQuality.low,
        errorWidget: (context, url, error) {
          return Container();
        },
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      filterQuality: FilterQuality.low,
      fadeInDuration: const Duration(milliseconds: 100),
      placeholder: (context, url) {
        return Image.asset('assets/image/placeholder.png');
      },
      errorWidget: (context, url, error) {
        return Container();
      },
    );
  }

  static Widget tryUrlImage(String? url) {
    if ((url ?? '').isEmpty) {
      return Container();
    }
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        /*child: FadeInImage(
        placeholder: AssetImage('assets/image/placeholder.png'),
        //image: AssetImage('assets/image/placeholder.png'),
        image: NetworkImage(url.replaceAll('\r\n', '')),
        filterQuality: FilterQuality.low,
      ),*/
        child: urlImage(url!));
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

  static Widget tile(BuildContext context, int pkey) {
    final index =
    DataBase.ideas.indexWhere((element) => element['pkey'] == pkey);
    //gesture detector used to be able to access an onTap - there are other ways to do it too, such as with a card (seen in Saved class)
    return GestureDetector(
      onTap: () {
        // on tap, takes to the builder page - and passes in the index
        Navigator.push(context, GlobalWidgets.swipePage(Idea(pkey: pkey)));
      },
      //the actual tile
      child: Container(
        // color of tile
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Theme
                .of(context)
                .colorScheme
                .primary, //0xff944788
          ),
          child: DataBase.ideas[index].isNotEmpty
              ? Column(children: [
            GlobalWidgets
                .tryUrlImage(DataBase.ideas[index]['imageUrlLink']),
            Text(
              // if idea is null, still displays a empty string to avoid throwing a null on screen
              DataBase.ideas[index]['dateIdea'] as String,
              style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                  fontFamily: 'Pridi',
                  fontSize: DataBase.ideas[index]['imageUrlLink'] != null
                      ? 15
                      : 17,
                  height: DataBase.ideas[index]['imageUrlLink'] != null
                      ? 1
                      : 1.5),
              textAlign: TextAlign.center,
            ),
          ])
              : Container()),
    );
  }

  static Widget loadWindow(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          (Themes.themeSettings[Settings.theme] ?? []).contains('shadeLoading')
              ? Theme
              .of(context)
              .colorScheme
              .primary
              : Colors.transparent,
          BlendMode.color),
      child: Scaffold(
        backgroundColor: Color(0xfffb66c2),
        bottomSheet: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height * .75),
          child: Image.asset('assets/image/loading.gif'),
        ),
      ),
    );
  }

  static PageRoute swipePage(Widget destination,
      {bool appBar = false, String? title}) {
    if (title != null) {
      appBar = true;
    }
    return CupertinoPageRoute(
        builder: (context) =>
            GestureDetector(
                child: appBar
                    ? Scaffold(
                  appBar: AppBar(
                    forceMaterialTransparency: title == null,
                    backgroundColor:
                    Theme
                        .of(context)
                        .colorScheme
                        .tertiaryContainer,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurface,
                        size: 25,
                      ),
                    ),
                    centerTitle: true,
                    title: Text(title ?? '',
                        style: TextStyle(
                            color:
                            (Themes.themeSettings[Settings.theme] ?? [])
                                .contains('invertSparklii')
                                ? Theme
                                .of(context)
                                .colorScheme
                                .onPrimary
                                : Theme
                                .of(context)
                                .colorScheme
                                .primary,
                            fontFamily: 'Georama',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            height: 0.85)),
                  ),
                  extendBodyBehindAppBar: title == null,
                  body: destination,
                )
                    : destination,
                onHorizontalDragEnd: (details) =>
                {
                  if (details.primaryVelocity! > 0) {Navigator.pop(context)}
                }));
  }
}
