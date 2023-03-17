import 'package:design_cheatsheet/helper/navigator.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 100),

            TextButton(
                onPressed: () => showNormalDialog("Success!", "Your transaction is success.", back),
                child: Text("Normal Dialog")
            ),

            TextButton(
                onPressed: () => showLargeDialog("Success!", "Your transaction is success.", back),
                child: Text("Large Dialog")
            ),

            TextButton(
                onPressed: () => showMaxDialog(),
                child: Text("Max Dialog")
            ),

          ],
        ),
      ),
    );
  }

  Future showNormalDialog(String title, String label, VoidCallback action){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(color: Colors.blueAccent)),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: action,
            child: const Text('Close', style: TextStyle(color: Colors.grey))
          ),
        ],
      ),
    );
  }

  Future showLargeDialog(String title, String label, VoidCallback action){
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10), // Dialog Size
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("lorem ipsum dolor ismet lorem ipsum dolor ismet lorem ipsum dolor ismet"),
              TextButton(
                onPressed: back,
                child: Text("Close"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Object?> showMaxDialog(){
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.white,
      barrierDismissible: false,
      pageBuilder: (context, _, __) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  TextButton(
                    onPressed: back,
                    child: Text("Close"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
