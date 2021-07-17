import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mushroom/home.dart';


BottomNavItemState itemState0=BottomNavItemState(Icons.thermostat_sharp,0);
BottomNavItemState itemState1=BottomNavItemState(Icons.timer,1);
BottomNavItemState itemState2=BottomNavItemState(Icons.stacked_line_chart,2);
BottomNavItemState itemState3=BottomNavItemState(Icons.settings,3);
int selectedID=0;
var first=true;
class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: MediaQuery.of(context).size.width/2-20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(0),
                    BottomNavItem(1)
                  ],
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width/2-20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(2),
                    BottomNavItem(3)
                  ],
                )
            ),
          ],
        ),
      ),
      color: Colors.lightBlue,
      shape: CircularNotchedRectangle(),
      notchMargin: 17,
      clipBehavior: Clip.antiAlias,
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final id;
  const BottomNavItem(this.id);
  @override
  State<StatefulWidget> createState() {

    if(id==0)
      return itemState0;
    else if(id==1)
      return itemState1;
    else if(id==2)
      return itemState2;
    else
      return itemState3;
  }
  // @override
  // BottomNavItemState createState() => BottomNavItemState(_icon,id);
}



class BottomNavItemState extends State<BottomNavItem> {
  IconData _icon;
  final int id;
  Color _color=Colors.white;
  double _size=30;
  BottomNavItemState(this._icon, this.id);
  bool isSelected=false;
  void setSelected(s){
    setState(() {
      this.isSelected=s;
      if(s) {
        this._size=36;
        this._color=Colors.pinkAccent;
      }else {
        this._size=30;
        this._color=Colors.white;
      }
    });
  }
  void onClick(){
    setSelection(this.id);
  }
  @override
  Widget build(BuildContext context) {
    if(first){
        first=false;
        selectedID=0;
        return IconButton(onPressed: this.onClick,
        icon: Icon(_icon,
            color: Colors.pinkAccent,
            size: 36),
            splashColor: Colors.red,
        );
    }else {
      return IconButton(onPressed: this.onClick,
        icon: Icon(_icon,
            color: _color,
            size: _size),
        splashColor: Colors.red,
      );
    }
  }
}

void setSelection(id){
  if(id==0){
    itemState0.setSelected(true);
    itemState1.setSelected(false);
    itemState2.setSelected(false);
    itemState3.setSelected(false);
  }else if(id==1){
    itemState0.setSelected(false);
    itemState1.setSelected(true);
    itemState2.setSelected(false);
    itemState3.setSelected(false);
  }else if(id==2){
    itemState0.setSelected(false);
    itemState1.setSelected(false);
    itemState2.setSelected(true);
    itemState3.setSelected(false);
  }else{
    itemState0.setSelected(false);
    itemState1.setSelected(false);
    itemState2.setSelected(false);
    itemState3.setSelected(true);
  }
  selectedID=id;
  SetBody(id);
}