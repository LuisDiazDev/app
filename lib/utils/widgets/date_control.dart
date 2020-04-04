import 'package:flutter/material.dart';

class DateControl extends StatefulWidget {
  final String text;
  final String titleText;
  final ValueChanged<String> onChanged;
  final GlobalKey formItemKey;
  final VoidCallback onRefresh;

  DateControl(
      {this.onRefresh,
      this.text,
      this.onChanged,
      this.formItemKey,
      this.titleText});

  @override
  _DateControlState createState() => _DateControlState();
}

class _DateControlState extends State<DateControl> {
  DateTime _date = new DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<bool> selectDate(BuildContext context) async {
    bool cambio = false;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2030));
    if (picked != null) {
      _date = picked;
      cambio = true;
    }
    return cambio;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 1, left: 16,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width *0.5,
            child: Text(widget.titleText),
          ),
          RaisedButton(
            child: widget.text != null && widget.text != ""
                ? Text('${widget.text.substring(0,10)}')
                : Text('Sin Asignar'),
            onPressed: () async {
              var cambio = await selectDate(context);
              if (cambio) {
                widget.onChanged(_date.toUtc().toString());
                widget.onRefresh();
              }
            },
          ),
        ],
      ),
    );
  }
}
