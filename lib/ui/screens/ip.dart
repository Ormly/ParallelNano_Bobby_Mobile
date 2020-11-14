import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/ip_validator.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:ParallelNano_Bobby_Mobile/rest/connection_checker.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: the whole thing and comment

class IPScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: _formKey,
                  initialValue: UserSettings().ipValue,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).textSelectionHandleColor,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'IP',
                    hintText: '255.255.255.255',
                  ),
                  keyboardType: TextInputType.number,
                  validator: IPValidator.validateIP,
                  onSaved: (value) => _saveIPValue(value),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text('Connect'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        FocusScope.of(context).unfocus(); // Closes the keyboard
                        ConnectionChecker.checkConnection(
                            _formKey.currentState.value, context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_saveIPValue(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(ip_value_key, value);
  UserSettings().ipValue = value;
}
