// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/viewModels/home_model.dart';
import 'package:todolist/widgets/app_text.dart';
import 'package:todolist/widgets/app_text_field.dart';
import 'package:todolist/widgets/app_text_line_through.dart';

import 'base_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double size = 20;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {/*Call something on the model*/},
      builder: (context, model, child) => AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green[500], Colors.green[200]],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: componentsPage(model),
        ),
      ),
    );
  }

  componentsPage(HomeModel model) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AppText("To do list", 40, Colors.white),
            Container(
              height: 500,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.elementList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listTodo(model, index);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            AppTextField(
                'Thing to do...', model.addElementContoller, Colors.green),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addButton(model),
                SizedBox(
                  width: 20,
                ),
                deleteDone(model)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listTodo(HomeModel model, int index) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              model.checkDoneElement(index);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    child: Center(
                        child:
                            AppText((index + 1).toString(), 20, Colors.white))),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(
                      child: model.elementList[index].isDone
                          ? AppTextLineThorough(
                              model.elementList[index].description,
                              20,
                              Colors.white)
                          : AppText(model.elementList[index].description, 20,
                              Colors.white)),
                ),
                SizedBox(
                  width: 10,
                ),
                model.elementList[index].isDone
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : Container(),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

// BUTTON
  Widget addButton(HomeModel model) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextButton(
          onPressed: () {
            model.add();
          },
          child: AppText('Add', 20, Colors.white)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Colors.green[800], Colors.green],
              // stops: [0.3,0.8],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft)),
    );
  }

  Widget deleteDone(HomeModel model) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextButton(
          onPressed: () {
            model.deleteDone();
          },
          child: AppText('Delete done', 20, Colors.white)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Colors.red[400], Colors.red],
              // stops: [0.3,0.8],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft)),
    );
  }
}
