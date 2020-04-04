import 'dart:convert';
import 'package:app/utils/widgets/multiSelects/select_model.dart';
import 'package:flutter/material.dart';

class MultiSelet extends StatefulWidget {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final bool filterable;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final int maxLength;

  MultiSelet(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      dynamic initialValue,
      bool autovalidate = false,
      this.titleText = 'Titulo',
      this.hintText = 'Toque para seleccionar uno o mas...',
      this.required = false,
      this.errorText = 'Seleccione uno o mas...',
      this.value,
      this.leading,
      this.filterable = true,
      this.dataSource,
      this.textField,
      this.valueField,
      this.change,
      this.open,
      this.close,
      this.trailing,
      this.maxLength});

  @override
  _MultiSeletState createState() => _MultiSeletState();
}

class _MultiSeletState extends State<MultiSelet> {
  List<Widget> _buildSelectedOptions() {
    List<Widget> selectedOptions = [];

    if (widget.value != null) {
      widget.value.forEach((item) {
        if (item != null) {
//                selectedOptions.add(Chip(
//                  label: Text(item[widget.textField],
//                      overflow: TextOverflow.ellipsis),
//                ));
          selectedOptions.add(ListTile(
            title: Text('$item'),
          ));
        }
      });
    }

    return selectedOptions;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          var results = await Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => SelectionModal(
                    title: widget.titleText,
                    filterable: widget.filterable,
                    valueField: widget.valueField,
                    textField: widget.textField,
                    dataSource: widget.dataSource,
                    values: [],
                    maxLength: widget.maxLength),
                fullscreenDialog: true,
              ));
          if (results != null) {
            if (results.length > 0) {
              setState(() {
//                widget
//                widget.value = results;
              });
            }
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red.shade400)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            errorText: null,
            errorMaxLines: 50,
          ),
//          isEmpty: (state.value == null || state.value == '' || (state.value != null &&  state.value.length == 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            text: widget.titleText,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor),
                            children: [
                              TextSpan(
                                text: widget.required ? ' *' : '',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.0),
                              ),
                              TextSpan(
                                text: widget.maxLength != null
                                    ? '(max ${widget.maxLength})'
                                    : '',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 13.0),
                              )
                            ]),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_downward,
                          color: Theme.of(context).primaryColor,
                          size: 30.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              (widget.value == null ||
                      widget.value == '' ||
                      (widget.value != null && widget.value.length == 0))
                  ? new Container(
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 6.0),
                      child: Text(
                        widget.hintText,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    )
                  : Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 1.0, // gap between lines
                      children: _buildSelectedOptions(),
                    )
            ],
          ),
        ));
  }
}

class MultiSelect extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final bool filterable;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final int maxLength;
  final GlobalKey formItemKey;

  MultiSelect(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      dynamic initialValue,
      bool autovalidate = false,
      this.titleText = 'Title',
      this.hintText = 'Tap to select one or more...',
      this.required = false,
      this.errorText = 'Please select one or more option(s)',
      this.value,
      this.leading,
      this.filterable = true,
      this.dataSource,
      this.textField,
      this.valueField,
      this.change,
      this.open,
      this.close,
      this.trailing,
      this.maxLength,
      this.formItemKey})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<dynamic> state) {
              List<Widget> _buildSelectedOptions(dynamic values, state) {
                List<Widget> selectedOptions = [];

                if (value != null) {
//            print(values);
                  var listValues = json.decode(value);
                  listValues.forEach((item) {
                    var existingItem = dataSource.singleWhere(
                        (itm) => itm[valueField] == "$item",
                        orElse: () => null);
                    if (existingItem != null) {
//                selectedOptions.add(Chip(
//                  label: Text(existingItem[textField],
//                      overflow: TextOverflow.ellipsis),
//                ));
                      selectedOptions.add(ListTile(
                        title: Text("${existingItem[textField]}"),
                      ));
                    }
                  });
                }

                return selectedOptions;
              }

              return InkWell(
                  onTap: () async {
                    var results = await Navigator.push(
                        state.context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => SelectionModal(
                              title: titleText,
                              filterable: filterable,
                              valueField: valueField,
                              textField: textField,
                              dataSource: dataSource,
                              values: value != null && value != ""
                                  ? json.decode(value)
                                  : [],
                              maxLength: maxLength ?? dataSource?.length),
                          fullscreenDialog: true,
                        ));

                    if (results != null) {
                      print(results);
                      onSaved(json.encode(results));
                      dynamic newValue;
                      if (results.length > 0) {
                        newValue = results;
                      }
                      state.didChange("$newValue");
                      if (change != null) {
                        change(newValue);
                      }
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.red.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      errorText: state.hasError ? state.errorText : null,
                      errorMaxLines: 50,
                    ),
                    isEmpty: (value == null || value == ''),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: titleText,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Theme.of(state.context)
                                              .primaryColor),
                                      children: [
                                        TextSpan(
                                          text: required ? ' *' : '',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.0),
                                        ),
                                        TextSpan(
                                          text: maxLength != null
                                              ? '(max $maxLength)'
                                              : '',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 13.0),
                                        )
                                      ]),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Theme.of(state.context).primaryColor,
                                    size: 30.0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        (value == null || value == '')
                            ? new Container(
                                margin:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 6.0),
                                child: Text(
                                  hintText,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              )
                            : Wrap(
                                spacing: 8.0, // gap between adjacent chips
                                runSpacing: 1.0, // gap between lines
                                children:
                                    _buildSelectedOptions(state.value, state),
                              )
                      ],
                    ),
                  ));
            });
}
