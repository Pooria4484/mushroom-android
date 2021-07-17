import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mushroom/bottomNav.dart';


var pp= "serial";


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String _title = 'Mushroom';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home:Directionality(
        textDirection: TextDirection.rtl,
        child:Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void connect(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(


      ),


      drawer: Drawer(

      ),

      body: (
          Center(
              child:MyInput()
          )
      ),
      bottomNavigationBar: BottomNav(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: connect,
        child: Icon(Icons.wifi_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class MyInput extends StatefulWidget {
  const MyInput({Key? key}) : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  var err="";
  // void onChange(value){
  //   if(value.toString().length<8) {
  //     setState(() {
  //       err = "خیلی کوتاه";
  //     });
  //   }else{
  //     err="";
  //     setState(() {
  //       p=150;
  //     });
  //   }
  // }
  double p=150;
  void onfocus(hasFocus){
    setState(() {
      if(hasFocus){
        p=30;
      }else{
        p=150;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Focus(
      onFocusChange: onfocus,
      child: Padding(
          padding: EdgeInsets.only(left:60.0, top:p,right:60.0,bottom:10.0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),
                textAlign: TextAlign.center,
                maxLength: 8,
                maxLines: 1,
                //onChanged: onChange,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 5),
                    alignLabelWithHint: true,
                    //floatingLabelBehavior:FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(),
                    filled: true,
                    hintText: 'ex:80101001',
                    labelText: 'شماره سریال دستگاه',
                    labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Vazir"
                    )
                ),
              )
            ],
          )
      ),
    );

  }
}
