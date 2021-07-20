import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              FloatingActionButton.extended(
                onPressed: null,
                label: Text(
                  'تنظیم دما',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Vazir',
                  ),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: null,
                label: Text(
                  'تنظیم رطوبت',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Vazir',
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
