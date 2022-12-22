import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({Key? key}) : super(key: key);

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  int radio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CheckboxCustom("I love banana", checkbox1, () => setState(() => checkbox1 = !checkbox1)),
          CheckboxCustom("I love apple",  checkbox2, () => setState(() => checkbox2 = !checkbox2)),

          const SizedBox(height: 50),
          RadioCustom("I prefer A", 1, () => setState(() => radio = 1)),
          RadioCustom("I prefer B", 2, () => setState(() => radio = 2)),
        ]
      ),
    );
  }

  Widget CheckboxCustom(String text, bool value, VoidCallback changeValue){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
        child: InkWell(
          onTap: changeValue,
          child: Row(
            children: [
              AnimatedContainer(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2, color: Colors.blue),
                    color: value ? Colors.blue : Colors.transparent),
                duration: const Duration(milliseconds: 200),
                child: value ? const Icon(Icons.check, size: 20, color: Colors.white) : Container(),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(text),
              )
            ],
          ),
        ),
      );
  }

  Widget RadioCustom(String text, int val, VoidCallback changeValue){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: changeValue,
        child: Row(
          children: [
            Radio<int>(
              value: val,
              activeColor: Colors.blue,
              groupValue: radio,
              onChanged: (int? value) {
                changeValue();
              },
            ),

            Text(text, style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
