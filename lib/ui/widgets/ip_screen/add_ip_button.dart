import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/widgets/ip_screen/ip_form.dart';

class AddIPButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      width: double.infinity,
      child: MaterialButton(
        child: Text('Add New IP'),
        onPressed: () => IPForm.addNewIP(context),
      ),
    );
  }
}
