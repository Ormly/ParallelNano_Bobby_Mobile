import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var itemList = ['0.0.0.0', '192.168.0.1', '255.255.255.255'];

/// This is the stateful widget that the main application instantiates.
class IpList extends StatefulWidget {
  IpList({Key key}) : super(key: key);

  @override
  _IpListState createState() => _IpListState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _IpListState extends State<IpList> {
  var dropdownValue = itemList[0];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: itemList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
