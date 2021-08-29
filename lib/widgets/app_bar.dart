import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final double paddingLeft;
  final List<Widget> actions;
  MyAppBar({required this.appBar, required this.paddingLeft, required this.actions});
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      elevation: 0.0,
      title: Container(
        padding: EdgeInsets.only(left: paddingLeft),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: [
                Text(
                  'Fuse',
                  style: TextStyle(color: Colors.red),
                ),
                Icon(Icons.lightbulb_outline, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}