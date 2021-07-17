import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom/bottomNav.dart';
import 'package:mushroom/main.dart';
//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
ValueNotifier valueNotifier =
    ValueNotifier<Icon>(Icon(Icons.wifi_protected_setup_sharp));
ValueNotifier tempVal = ValueNotifier<int>(25);
ValueNotifier tempSet = ValueNotifier<int>(25);
ValueNotifier bodyID = ValueNotifier<int>(0);

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  static const String _title = 'Mushroom';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: PageBody(),
          ),
          drawer: Drawer(),
          floatingActionButton: WifiButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: BottomNav(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WifiButton extends StatefulWidget {
  const WifiButton({Key? key}) : super(key: key);
  @override
  _WifiButtonState createState() => _WifiButtonState();
}

class _WifiButtonState extends State<WifiButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: wifiOnClick,
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (ctx, value, child) {
          return valueNotifier.value;
        },
      ),
    );
  }
}

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bodyID,
      builder: (ctx, value, child) {
        if (bodyID.value == 0) {
          return TempBody();
        } else if (bodyID.value == 1) {
          return TimerBody();
        } else if (bodyID.value == 2) {
          return ChartBody();
        } else {
          return SettingsBody();
        }
      },
    );
  }
}

class Notify extends Notification {
  final String key;
  Notify(this.key);
}

// class TempBody extends StatefulWidget {
//   const TempBody({Key? key}) : super(key: key);
//
//   @override
//   _TempBodyState createState() => _TempBodyState();
// }

class TempBody extends StatelessWidget {
  const TempBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Card(
          color: Colors.amberAccent,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: TempCard(

                ),
              ),
            ),
          ),
        ),
        Card(
          color: Colors.lightBlueAccent,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
        ),
        Card(
          color: Colors.white38,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TempCard extends StatefulWidget {
  const TempCard({Key? key}) : super(key: key);

  @override
  _TempCardState createState() => _TempCardState();
}

class _TempCardState extends State<TempCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text('دمای فعلی',
                style: TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 25,
                  color: Colors.black
                ),
            ),
            Text('دمای تنظیم شده',
              style: TextStyle(
                fontFamily: "Vazir",
                fontSize: 18,
                color: Colors.black54
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('32° C',
              style: TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 30,
                  color: Colors.black
              ),
              textDirection: TextDirection.ltr,
            ),
            Text('22° C',
              style: TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 18,
                  color: Colors.black54
              ),
              textDirection: TextDirection.ltr,
            ),
          ],
        )
      ],

    );
  }
}

class TimerBody extends StatefulWidget {
  const TimerBody({Key? key}) : super(key: key);

  @override
  _TimerBodyState createState() => _TimerBodyState();
}

class _TimerBodyState extends State<TimerBody> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Mist',
      textDirection: TextDirection.ltr,
    );
  }
}

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'settings',
      textDirection: TextDirection.ltr,
    );
  }
}

class ChartBody extends StatefulWidget {
  const ChartBody({Key? key}) : super(key: key);

  @override
  _ChartBodyState createState() => _ChartBodyState();
}

class _ChartBodyState extends State<ChartBody> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'charts',
      textDirection: TextDirection.ltr,
    );
  }
}

void SetBody(id) {
  bodyID.value = id;
}
