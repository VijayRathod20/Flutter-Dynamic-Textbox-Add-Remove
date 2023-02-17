
import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  List<TextEditingController> textBox = [];

  @override
  void initState() {
    // TODO: implement initState
    textBox.add(TextEditingController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context,index){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                        child:TextField(controller: textBox[index],),
                    ),
                    textBox.last== textBox[index]?
                    IconButton(onPressed: (){
                      setState(() {
                        textBox.add(TextEditingController());
                      });
                    }, icon: const Icon(Icons.add)):Container(),
                    index==0?Container():IconButton(onPressed: (){
                      setState(() {
                        textBox.removeAt(index);
                      });
                    }, icon: const Icon(Icons.remove)),
                  ],
                ),
              )
            ],
          );
        },itemCount: textBox.length,),
      ),
    );
  }
}
