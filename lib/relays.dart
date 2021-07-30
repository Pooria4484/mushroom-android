import 'package:flutter/material.dart';

ValueNotifier waterRelay = ValueNotifier<bool>(false);
ValueNotifier motorRelay = ValueNotifier<bool>(false);
ValueNotifier speedRelay = ValueNotifier<bool>(false);

ValueNotifier fanRelay = ValueNotifier<bool>(false);

ValueNotifier mistRelay = ValueNotifier<bool>(false);

class RelaysBody extends StatelessWidget {
  const RelaysBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                'کولر',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'پمپ',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              ),
              ValueListenableBuilder(
                  valueListenable: waterRelay,
                  builder: (ctx, value, child) {
                    return Switch(
                      value: waterRelay.value,
                      onChanged: (val){

                      },
                      activeColor: Colors.blueAccent,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.red,
                    );
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'موتور',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              ),
              ValueListenableBuilder(
                  valueListenable: motorRelay,
                  builder: (ctx, value, child) {
                    return Switch(
                      value: motorRelay.value,
                      onChanged: (val){

                      },
                      activeColor: Colors.blueAccent,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.red,
                    );
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'سرعت',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              ),
              ValueListenableBuilder(
                  valueListenable: speedRelay,
                  builder: (ctx, value, child) {
                    return Switch(
                      value: speedRelay.value,
                      onChanged: (val){

                      },
                      activeColor: Colors.blueAccent,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.red,
                    );
                  })
            ],
          ),
          Divider(
            height: 20,
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'بخار ساز',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              ),
              ValueListenableBuilder(
                  valueListenable: mistRelay,
                  builder: (ctx, value, child) {
                    return Switch(
                      value: mistRelay.value,
                      onChanged: (val){

                      },
                      activeColor: Colors.blueAccent,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.red,
                    );
                  })
            ],
          ),
          Divider(
            height: 20,
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'تهویه',
                style: TextStyle(
                    fontFamily: "Vazir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textDirection: TextDirection.rtl,
              ),
              ValueListenableBuilder(
                  valueListenable: fanRelay,
                  builder: (ctx, value, child) {
                    return Switch(
                      value: fanRelay.value,
                      onChanged: (val){

                      },
                      activeColor: Colors.blueAccent,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.red,
                    );
                  })
            ],
          ),

        ],
      ),
    );
  }
}
