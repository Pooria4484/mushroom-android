import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom/bottomNav.dart';
import 'package:mushroom/main.dart';

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];
//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
ValueNotifier valueNotifier =
    ValueNotifier<Icon>(Icon(Icons.wifi_protected_setup_sharp));
ValueNotifier tempVal = ValueNotifier<int>(250);

ValueNotifier tempGoal = ValueNotifier<int>(25);
ValueNotifier bodyID = ValueNotifier<int>(0);

ValueNotifier huVal = ValueNotifier<int>(600);
ValueNotifier huGoal = ValueNotifier<int>(75);

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
              //tempVal.value++;
              //tempGoal.value--;
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: TempCard(),
              ),
            ),
          ),
        ),
        Card(
          color: Colors.lightBlueAccent,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              //print('Card tapped.');
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: MistCard(),
              ),
            ),
          ),
        ),
        Card(
          color: Colors.white38,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              //print('Card tapped.');
            },
            child: const SizedBox(
              height: 110,
              child: Center(child: Co2Card()),
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
            Text(
              'دمای محیط',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 25, color: Colors.black),
            ),
            Text(
              'دمای تنظیم شده',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TempVal(),
            TempSetVal()
            // Text(
            //   '22° C',
            //
            //   textDirection: TextDirection.ltr,
            // ),
          ],
        )
      ],
    );
  }
}

class Co2Card extends StatefulWidget {
  const Co2Card({Key? key}) : super(key: key);

  @override
  _Co2CardState createState() => _Co2CardState();
}

class _Co2CardState extends State<Co2Card> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'غلظت CO2',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 25, color: Colors.black),
            ),
            Text(
              'غلظت تنظیم شده',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '400 ppm',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 30, color: Colors.black),
              textDirection: TextDirection.ltr,
            ),
            Text(
              '250 ppm',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
              textDirection: TextDirection.ltr,
            ),
          ],
        )
      ],
    );
  }
}

class MistCard extends StatefulWidget {
  const MistCard({Key? key}) : super(key: key);

  @override
  _MistCardState createState() => _MistCardState();
}

class _MistCardState extends State<MistCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'رطوبت هوا',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 25, color: Colors.black),
            ),
            Text(
              'رطوبت تنظیم شده',
              style: TextStyle(
                  fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HuCVal(),
            HuGoalVal(),
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
      'Timers',
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
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 250),
      child: LineChart(
        showAvg ? avgData() : mainData(),
      ),
    );
  }
}

void setBody(id) {
  bodyID.value = id;
}

class TempVal extends StatefulWidget {
  const TempVal({Key? key}) : super(key: key);

  @override
  _TempValState createState() => _TempValState();
}

class _TempValState extends State<TempVal> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tempVal,
      builder: (ctx, value, child) {
        return Text(
          (tempVal.value / 10).toString() + ' °C',
          style:
              TextStyle(fontFamily: "Vazir", fontSize: 30, color: Colors.black),
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}

class TempSetVal extends StatefulWidget {
  const TempSetVal({Key? key}) : super(key: key);

  @override
  _TempSetValState createState() => _TempSetValState();
}

class _TempSetValState extends State<TempSetVal> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tempGoal,
      builder: (ctx, value, child) {
        return Text(
          tempGoal.value.toString() + ' °C',
          style: TextStyle(
              fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}

class HuCVal extends StatefulWidget {
  const HuCVal({Key? key}) : super(key: key);

  @override
  _HuCValState createState() => _HuCValState();
}

class _HuCValState extends State<HuCVal> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: huVal,
      builder: (ctx, value, child) {
        return Text(
          (huVal.value / 10).toString() + ' %',
          style:
              TextStyle(fontFamily: "Vazir", fontSize: 30, color: Colors.black),
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}

class HuGoalVal extends StatefulWidget {
  const HuGoalVal({Key? key}) : super(key: key);

  @override
  _HuGoalValState createState() => _HuGoalValState();
}

class _HuGoalValState extends State<HuGoalVal> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: huGoal,
      builder: (ctx, value, child) {
        return Text(
          huGoal.value.toString() + ' %',
          style: TextStyle(
              fontFamily: "Vazir", fontSize: 18, color: Colors.black54),
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}

void setTempVal(i) {
  tempVal.value = i;
}

void setTempGoalVal(i) {
  tempGoal.value = i;
}

void setHuVal(i) {
  huVal = i;
}

void setHuGoalVal(i) {
  huGoal = i;
}


LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) =>
        const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 10),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return 'MAR';
            case 3:
              return 'JUN';
            case 5:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData:
    FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 0),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),

        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}

LineChartData avgData() {
  return LineChartData(
    lineTouchData: LineTouchData(enabled: false),
    gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.red,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) =>
        const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 10),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData:
    FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3.44),
          FlSpot(2.6, 3.44),
          FlSpot(4.9, 3.44),
          FlSpot(6.8, 3.44),
          FlSpot(8, 3.44),
          FlSpot(9.5, 3.44),
          FlSpot(11, 3.44),
        ],
        isCurved: true,
        colors: [
          ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
        ],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)!
              .withOpacity(0.1),
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)!
              .withOpacity(0.1),
        ]),
      ),
    ],
  );
}

