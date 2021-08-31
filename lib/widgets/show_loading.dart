import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowLoading extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitChasingDots(
              color: Colors.red[300],
              size: 100.0,
            ),
            SizedBox(height: 20),
            Text(
              "Fetching latest news for you...",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
