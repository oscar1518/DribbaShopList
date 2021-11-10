import 'package:flutter/cupertino.dart';
import 'package:todolist/Models/listElement.dart';
import 'package:todolist/enums/view_state.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  //STATE CONTROLLER
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  //VARIABLES

  TextEditingController addElementContoller = TextEditingController();

  List<ListElement> elementList = [];

  // METHODS :

  void add() async {
    setState(ViewState.Busy);
    try {
      elementList.add(
          ListElement(description: addElementContoller.text, isDone: false));
    } catch (ex) {
      print(ex.toString());
    } finally {
      addElementContoller.clear();
      setState(ViewState.Idle);
    }
  }

  void checkDoneElement(int index) {
    setState(ViewState.Busy);
    try {
      if (elementList[index].isDone) {
        elementList[index].isDone = false;
      } else {
        elementList[index].isDone = true;
      }
    } catch (ex) {
      print(ex.toString());
    } finally {
      setState(ViewState.Idle);
    }
  }

  void deleteDone() {
    setState(ViewState.Busy);
    try {
      elementList.removeWhere((element) => element.isDone == true);
    } catch (ex) {
      print(ex.toString());
    } finally {
      setState(ViewState.Idle);
    }
  }
}
