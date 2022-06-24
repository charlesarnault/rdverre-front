import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String title, message;
  EmptyState({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 24, top: 48, right: 24),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          color: Theme.of(context).cardColor.withOpacity(.95),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title, style: Theme.of(context).textTheme.headline3),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
