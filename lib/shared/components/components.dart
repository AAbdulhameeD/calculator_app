import 'package:calculator_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

Widget defaultAppBar(
  BuildContext context, {
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        icon: Icon(
          IconBroken.Arrow___Left_2,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: actions,
      title: Text(
        title!,
        style: TextStyle(fontSize: 20.0),
      ),
      titleSpacing: 2.0,
    );

Widget defaultOutlineButton(
        {required context,required String text, required Function onPressed,double?height =double.infinity,int?flex=1 }) =>
    Expanded(
      flex: flex!,
      child: Container(height: height!,
        child: OutlinedButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style: Theme.of(context).textTheme.button
          ),
        ),
      ),
    );
