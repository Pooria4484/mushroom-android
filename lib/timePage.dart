import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class TimersBody extends StatelessWidget {
  const TimersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Divider(
            height: 20,
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'تایمر فن',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: FanOnTimePicker(),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: Text('خاموش'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FanOnTimePicker extends StatefulWidget {
  const FanOnTimePicker({Key? key}) : super(key: key);

  @override
  _FanOnTimePickerState createState() => _FanOnTimePickerState();
}

class _FanOnTimePickerState extends State<FanOnTimePicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return DurationPicker(
      duration: _duration,
      onChange: (val) {
        setState(() => _duration = val);
      },
      snapToMins: 1.0,
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Duration Picker Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Duration Picker Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Duration _duration = Duration(hours: 0, minutes: 0);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//                 child: DurationPicker(
//                   duration: _duration,
//                   onChange: (val) {
//                     setState(() => _duration = val);
//                   },
//                   snapToMins: 5.0,
//                 ))
//           ],
//         ),
//       ),
//       floatingActionButton: Builder(
//           builder: (BuildContext context) => FloatingActionButton(
//             onPressed: () async {
//               var resultingDuration = await showDurationPicker(
//                 context: context,
//                 initialTime: Duration(minutes: 30),
//               );
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Chose duration: $resultingDuration')));
//             },
//             tooltip: 'Popup Duration Picker',
//             child: Icon(Icons.add),
//           )),
//     );
//   }
// }
