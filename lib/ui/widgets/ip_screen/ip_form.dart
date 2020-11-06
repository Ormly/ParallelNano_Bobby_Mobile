import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/ip_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A [SimpleDialog] class to input a new IP address.
///
/// It builds a pop up dialog that allows the user to input an IP
/// address that gets added to the Shared Preferences IP address list.
class IPForm {
  static Future<void> addNewIP(context) async {
    var _formKey = GlobalKey<FormFieldState>();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Write new IP to add'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                left: 16.0,
              ),
              child: TextFormField(
                key: _formKey,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).textSelectionHandleColor,
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'IP',
                  hintText: '255.255.255.255',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
                keyboardType: TextInputType.number,
                validator: IPValidator.validateIP,
                onSaved: (value) => _saveValue(value),
              ),
            ),

            /// A row with two buttons to add the value
            /// of the TextField or cancel the pop-up.
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Ok',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

/// Saves the new IP into the Shared Preferences
/// if it does not already exist
_saveValue(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var itemList = <String>[];
  if (prefs.containsKey(ip_key)) itemList = prefs.getStringList(ip_key);
  if (!itemList.contains(value)) itemList.add(value);
  await prefs.setStringList(ip_key, itemList);
}
