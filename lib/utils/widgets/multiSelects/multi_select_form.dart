import 'dart:convert';

import 'package:app/utils/widgets/multiSelects/multi_select.dart';
import 'package:flutter/material.dart';

const SHOW = "display";
const VALUE = "value";

class MultiSelectForm extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final String titleText;
  final String errorText;
  final dynamic value;
  final GlobalKey formItemKey;
  final String fieldCollection;

  MultiSelectForm(
      {this.fieldCollection,
      this.onChanged,
      this.titleText,
      this.errorText,
      this.hintText,
      this.formItemKey,
      this.value});

  @override
  _MultiSelectFormState createState() => _MultiSelectFormState();
}

class _MultiSelectFormState extends State<MultiSelectForm> {
  List<Map> dataFromBd = new List<Map>();
  bool upload = false;

  void initState() {
    super.initState();
    getDataFromServer();
  }

  void getDataFromServer() {
    if (dataFromBd.length <= 0) {
      dataFromBd.add({
        "value":"1",
        "display":"prueba 1"
      });
      dataFromBd.add({
        "value":"2",
        "display":"prueba 2"
      });
      dataFromBd.add({
        "value":"3",
        "display":"prueba 3"
      });
      dataFromBd.add({
        "value":"4",
        "display":"prueba 4"
      });
      dataFromBd.add({
        "value":"5",
        "display":"prueba 5"
      });
      dataFromBd.add({
        "value":"6",
        "display":"prueba 6"
      });

      setState(() {
        upload = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: upload
          ? MultiSelect(
              formItemKey: widget.formItemKey,
              hintText: widget.hintText,
              titleText: widget.titleText,
              errorText: widget.errorText,
              dataSource: dataFromBd,
              textField: SHOW,
              valueField: VALUE,
              filterable: true,
              required: false,
              value: widget.value,
              onSaved: widget.onChanged,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
