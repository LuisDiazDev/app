import 'dart:convert';

import 'package:app/pages/drawer/custom_drawer.dart';
import 'package:app/services/Comercial.dart';
import 'package:app/utils/status.dart';
import 'package:app/utils/widgets/charts/grouped_bar_chart.dart';
import 'package:app/utils/widgets/charts/grouped_fill_color_bar_chart.dart';
import 'package:app/utils/widgets/charts/pie_outside_label.dart';
import 'package:app/utils/widgets/charts/simple_bar.dart';
import 'package:app/utils/widgets/date_control.dart';
import 'package:app/utils/widgets/multiSelects/multi_select_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Comercial extends StatefulWidget {
  @override
  _ComercialState createState() => _ComercialState();
}

class _ComercialState extends State<Comercial> {

  List<bool> isSelectedSearch = [true, false];
  List<bool> isSelectedType = [false, false,false];
  List<FocusNode> focusToggle;
  String from,to,selects,multiSelect="";

  void selectType(int index)async{
    switch(index){
      case 0:{
//        var d = await getAllConsultor();
        multiSelect = "Consultores";
        setState(() {
          selects = null;
          isSelectedSearch[index] = true;
          isSelectedSearch[1] = false;
        });
        break;
      }
      case 1:{
        multiSelect ="Cliente";
        setState(() {
          selects = null;
          isSelectedSearch[index] = true;
          isSelectedSearch[0] = false;
        });
        break;
      }
    }
  }

  void selectShowData(int index){
    switch(index){
      case 0:{
        setState(() {
          isSelectedType[index] = true;
          isSelectedType[1] = false;
          isSelectedType[2] = false;
        });
        break;
      }
      case 1:{
        setState(() {
          isSelectedType[index] = true;
          isSelectedType[0] = false;
          isSelectedType[2] = false;
        });
        break;
      }
      case 2:{
        setState(() {
          isSelectedType[index] = true;
          isSelectedType[0] = false;
          isSelectedType[1] = false;
        });
        break;
      }
    }
  }

  Widget principal(){
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ToggleButtons(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Text("Consultor"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child:  Center(
                    child:  Text("Cliente"),
                  ),
                ),
              ],
              onPressed: selectType,
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              isSelected: isSelectedSearch,
              highlightColor: Colors.blueAccent,
              splashColor: Colors.lightBlue,
              borderColor: Colors.white,
              borderWidth: 5,
              focusColor: Colors.red,
              focusNodes: focusToggle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text('Periodo',style: TextStyle(fontSize: 18),),
          ),
        ),
        DateControl(
          text: from,
          titleText: 'desde',
          formItemKey: null,
          onRefresh: (){
            setState(() {});
          },
          onChanged: (newValue){
            from = newValue;
          },
        ),
        DateControl(
          text: to,
          titleText: 'hasta',
          formItemKey: null,
          onRefresh: (){
            setState(() {});
          },
          onChanged: (newValue){
            to = newValue;
          },
        ),
        MultiSelectForm(
          titleText: multiSelect,
          hintText: "Seleccione alguno",
          onChanged: (dynamic value){
            selects = value;
          },
          value: selects,
        ),
        Center(
          child: ToggleButtons(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Center(
                  child: Text("Relatorio"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width * 0.3,
                child:  Center(
                  child:  Text("Grafico"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width * 0.3,
                child:  Center(
                  child:  Text("Pizza"),
                ),
              ),
            ],
            onPressed: selectShowData,
            selectedColor: Colors.amberAccent,
            fillColor: Colors.blue,
            isSelected: isSelectedType,
            highlightColor: Colors.blueAccent,
            splashColor: Colors.lightBlue,
            borderColor: Colors.white,
            borderWidth: 5,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            ),
          ),
        ),
        showData()
      ],
    );
  }

  Widget showData(){
    Widget data = Container();
    if(isSelectedType[0]){

    }else if(isSelectedType[1]){
      data = Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: GroupedFillColorBarChart.withSampleData(),
      );
    }else if(isSelectedType[2]){
      data = Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.6,
        child: PieOutsideLabelChart.withSampleData(),
      );
    }

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    multiSelect = "Consultores";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
//          drawer: CustomDrawer(page: pages.comercial,),
          appBar: AppBar(
            title: Text('Comercial'),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              principal()
            ],
          ),
        ),
        onWillPop: null);
  }
}
