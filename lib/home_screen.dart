import 'package:flutter/material.dart';

import 'my_radio_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RadioButtonModel> radioOptions = [];

  @override
  void initState() {
    super.initState();
    radioOptions.add(RadioButtonModel(false, 'A', 'Option A'));
    radioOptions.add(RadioButtonModel(false, 'B', 'Option B'));
    radioOptions.add(RadioButtonModel(false, 'C', 'Option C'));
    radioOptions.add(RadioButtonModel(false, 'D', 'Option D'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Check Box Example'),
      ),
      body: MyRadioButtonWidget(
        options: radioOptions,
        onItemSelected: (index) {
          print('I am index: $index');
        },
      ),
    );
  }
}
