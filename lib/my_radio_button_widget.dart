import 'package:flutter/material.dart';

class MyRadioButtonWidget extends StatefulWidget {
  final List<RadioButtonModel>? options;
  final Function(int)? onItemSelected;

  const MyRadioButtonWidget({Key? key, this.options, this.onItemSelected})
      : super(key: key);

  @override
  createState() {
    return MyRadioButtonWidgetState();
  }
}

class MyRadioButtonWidgetState extends State<MyRadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.options!.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (var element in widget.options!) {
                element.isSelected = false;
              }
              widget.options![index].isSelected = true;

              widget.onItemSelected!(index);
            });
          },
          child: IconRadioButtonItem(widget.options![index]),
        );
      },
    );
  }
}

class SquareRadioButtonItem extends StatelessWidget {
  final RadioButtonModel _item;

  const SquareRadioButtonItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(_item.text),
          )
        ],
      ),
    );
  }
}

class CircleRadioButtonItem extends StatelessWidget {
  final RadioButtonModel _item;

  const CircleRadioButtonItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(_item.text),
          )
        ],
      ),
    );
  }
}

class IconRadioButtonItem extends StatelessWidget {
  final RadioButtonModel _item;

  const IconRadioButtonItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _item.isSelected
              ? const Icon(Icons.circle)
              : const Icon(Icons.circle_outlined),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioButtonModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioButtonModel(this.isSelected, this.buttonText, this.text);
}
