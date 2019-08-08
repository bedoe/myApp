import 'package:flutter/material.dart';

void main() => runApp(Start());

class Start extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Start",
      home: GotYa(sampleList: ["Short game" , "Medium Game", "Long Game"],)
    );
  }
}

class GotYa extends StatefulWidget {
  GotYa({Key key, this.sampleList}) : super(key: key);

  final List sampleList;
  @override
  _GotYaState createState() => _GotYaState();
}

class _GotYaState extends State<GotYa>
{
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("I started")),
      body: ListView.builder(
        itemCount: widget.sampleList.length,
        itemBuilder: itemBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _addAnotherOne(context),
        tooltip: "Add another",
        child: Icon(Icons.add),
      ),
    );
  }
    _addAnotherOne(BuildContext context){
      return showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: Text("Add a game"),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Enter new game"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: Text("cancel"),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
              new FlatButton(
                child: Text("Add game"),
                onPressed: ()=> _appendToList(_textEditingController.text)
                ),
            ]);
        }
          );
        }
      // setState(() {
      //   widget.sampleList.add("New game!");
      // });
  _appendToList(value)
  {
    setState(() {
      widget.sampleList.add(value);
    });
    Navigator.of(context).pop();
  }  

  Widget itemBuilder(BuildContext context, int index)
  {
    double topMargin = index==0 ? 7 : 0;
    return GestureDetector(
      // title: Text(widget.sampleList[index]),
      // trailing: FlatButton(
      //   onPressed: () => _handleShit(index),
      //   child: Text("Click"),
      child: Container(
      margin:  EdgeInsets.fromLTRB(7, topMargin, 0, 10),  
        child: Text(widget.sampleList[index], style: TextStyle(fontSize: 30.0),),
      ),
      onTap: () => _handleShit(index),
    );
  }
  _handleShit(int index)
  {
    setState(() {
      switch (widget.sampleList[index]) {
        case "sample":
          widget.sampleList[index] = "Normal game";
          break;
        default:
          widget.sampleList[index] = "sample";
      }
    });

    // int newIndex = index + 1;
    // print("Button $newIndex pressed");
  }
}